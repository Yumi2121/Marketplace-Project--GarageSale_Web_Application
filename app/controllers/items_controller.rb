class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]



  # GET /items or /items.json
  def index
    if params.has_key?(:category)
      category = params[:category]
      # for filter the item by category, select all the items that match the selected category_id in item table in sql database
      @items = Item.find_by_sql("SELECT * FROM Items WHERE category=#{category}")
      # hide the search-bar when perform category search
      @show_search_bar = false
    elsif params.has_key?(:keyword)
      keyword = params[:keyword]
      # for the search bar function, select all the items that the item title partially match the keyword that the user typed, also it's case insensitive
      @items = Item.find_by_sql("SELECT * FROM Items WHERE title ILIKE '%#{keyword}%'")
      # hide the search-bar when perform category search
      @show_search_bar = false
    else
      @items = Item.all

      @show_search_bar = true
    end
  end

  # GET /items/1 or /items/1.json
  def show
    if current_user
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
                       name: @item.title,
                       # description: @item.description,
                       images: [rails_blob_url(@item.item_image)],
                       amount: (@item.price * 100).to_i,
                       currency: 'aud',
                       quantity: 1,
                     }],
        payment_intent_data: {
          metadata: {
            item_id: @item.id,
            user_id: current_user.id
          }
        },
        success_url: "#{root_url}payments/success?itemId=#{@item.id}",
        cancel_url: "#{root_url}items"
      )
      @session_id = session.id
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to users_show_path, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to users_show_path, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to users_show_path, notice: "Item was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def authorize_user
      if current_user.id != @item.user_id
        flash[:alert] = "you cannot do that!"
        redirect_to items_path
      end
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :category, :price, :item_image, :sold, :user_id)
    end
end
