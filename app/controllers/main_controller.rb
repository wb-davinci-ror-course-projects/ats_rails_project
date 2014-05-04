class MainController < ApplicationController

  def index
    render :index and return
  end

  def product_category
    product_category = Category.find(params[:id]).name
    @header = "#{product_category}"
    @products = Product.where(category: product_category)
    render :show and return
  end

  def more_info_id
    id = params[:id]
    @header = "Product Detail Page"
    @product = Product.find_by(id: id)
    render :more_info and return
  end

  def about
    render :about and return
  end

  def contact
    render :contact and return
  end
  
  def full_image 
    render :full_image, layout: false and return
  end

end
