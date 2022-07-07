class Item < ApplicationRecord
  belongs_to :user
  has_many :orders

  enum category: {Clothes: 0, Toys: 1, Kitchenware: 2, Furniture: 3, Misc: 4}
  has_one_attached :item_image

  # if don't have has_one_attached, will show -- unknown attribute 'image' for Item.

  validates :title, presence: true
  validates :price, numericality: { greater_than: 0 }

  def dollar_price
    price / 100.0
  end
end