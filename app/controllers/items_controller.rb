class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy]
  before_action :authenticate_user!, expect: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  # GET /items or /items.json
  def index
    @items = Item.all
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
                       images: [@item.item_image],
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
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
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
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
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
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
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
