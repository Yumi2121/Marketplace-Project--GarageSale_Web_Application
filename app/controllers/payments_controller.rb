class PaymentsController < ApplicationController

  def success
    @item = Item.find(params["itemId"])

    Order.create(
      item_id: @item.id,
      seller_id: @item.user_id,
      buyer_id: current_user.id
    )

    @item.update(sold: true)
  end
end