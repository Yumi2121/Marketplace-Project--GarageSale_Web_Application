class AddDetailsToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :price, :integer
    add_column :items, :sold, :boolean, default: false
  end
end
