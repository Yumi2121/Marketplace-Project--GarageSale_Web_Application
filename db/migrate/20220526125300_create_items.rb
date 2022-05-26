class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :category
      t.float :price

      t.timestamps
    end
  end
end
