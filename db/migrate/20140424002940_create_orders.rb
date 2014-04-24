class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.float :tax
      t.float :ship_cost

      t.timestamps
    end
  end
end
