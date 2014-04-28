class Products < ActiveRecord::Migration
  def change
      create_table :products do |t|
          t.string :category
          t.string :product_code
          t.string :name
          t.integer  :quantity
          t.string :description
          t.float :price
          t.string :image
          t.float  :category_id
          t.float  :percent_off
          t.text :more_info
          t.timestamp
      end
  end
end
