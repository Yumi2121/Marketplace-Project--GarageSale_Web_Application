class Item < ApplicationRecord
  enum category: {Clothes: 0, Toys: 1, Kitchenware: 2, Furniture: 3, Misc: 4}
  has_one_attached :item_image
end
