class CartId < ActiveRecord::Migration
  def change
    add_column :carts, :cart_id, :string
    add_column :carts, :price, :float
  end
end
