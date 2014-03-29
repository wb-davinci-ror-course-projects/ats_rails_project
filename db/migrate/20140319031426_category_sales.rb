class CategorySales < ActiveRecord::Migration
  def change
    create_table :category_sales do |t|
        t.string :category_name
        t.float  :percent_off
        t.float :category_id
        t.timestamp
    end
  end
end
