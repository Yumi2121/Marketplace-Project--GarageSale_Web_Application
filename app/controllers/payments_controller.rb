class PaymentsController < ApplicationController

  def success
    @item = Item.find(params["itemId"])
  end

end