class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :product_id
      t.integer :quantity
      t.string :ship_method

      t.timestamps
    end
  end
end
