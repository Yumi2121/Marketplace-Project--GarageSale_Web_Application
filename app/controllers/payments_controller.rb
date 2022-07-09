class PaymentsController < ApplicationController

  def success
    @item = Item.find(params["itemId"])

    Order.create(
      item_id: @item.id,
      seller_id: @item.user_id,
      buyer_id: current_user.id
    )

    @item.update(sold: true)

    seller_email = User.find_by_id(@item.user_id).email
    buyer_email = current_user.email
    buyer_name = current_user.first_name
    item_title = @item.title

    # Put the mailout inside the exception, so when it failed the website still function
    begin
      MailgunHelper::send_email('admin@garagesale.com', seller_email,'Your item is sold', " #{buyer_name} bought one of your item #{item_title}.")
      MailgunHelper::send_email('admin@garagesale.com', buyer_email,'You bought an item', "You bought an item #{item_title}." )
    rescue => e
    end

  end
end

