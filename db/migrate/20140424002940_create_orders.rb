class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :user_id
      t.integer :product_id
      t.float :price_paid_for_product
      t.integer :quantity
      t.float :tax
      t.float :ship_cost
      t.float :order_total

      t.timestamps
    end
  end
end
