class Products < ActiveRecord::Migration
  def change
      create_table :products do |t|
          t.string :category
          t.string :product_code
          t.string :name
          t.float  :quantity
          t.string :description
          t.string :price
          t.string :image
          t.float  :category_id
          t.text :more_info
      end
  end
end
