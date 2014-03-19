class CategorySale < ActiveRecord::Base
  validates :percent_off, presence: true
  validates :category_name, presence: true
  belongs_to :category, class_name: "Category", foreign_key: "category_id"
end

