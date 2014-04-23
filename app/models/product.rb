class Product < ActiveRecord::Base
  validates :category, presence: true
  validates :product_code, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  belongs_to :cart

# following to use to test 'whenever' gem not intended for final use
#def product_quantity
#   1.times do
#     product = Product.first
#     product.quantity = product.quantity - 10
#     product.save!
#   end
# end

end

