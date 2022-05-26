class AddAddressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address, :string
    add_column :users, :post_code, :integer
  end
end
