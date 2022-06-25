class Item < ApplicationRecord
  belongs_to :user
  enum category: {Clothes: 0, Toys: 1, Kitchenware: 2, Furniture: 3, Misc: 4}
  has_one_attached :item_image
  # if don't have has_one_attached, will show -- unknown attribute 'image' for Item.


end
