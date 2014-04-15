class AdminController < ApplicationController

before_action :set_admin, only: [:links, :new, :create, :edit, :update, :category_sale_edit, 
:category_sale_edit_post, :product_sale, :product_sale_edit_post]

def index
  render :index, layout: false and return
end

def signin
   
  if Admin.find_by(username: params[:username])== nil
      flash[:danger] = "Username was entered incorrectly or doesn't exist. 
                          <i style='color: gray'>If you haven't done so already, please create an account below.</i>".html_safe
    render :index, layout: false and return
  else
      admin = Admin.find_by(username: params[:username]) 
    if admin.authenticate(params[:password]) != false 
      session[:admin_user] = admin.username
      render :links, layout: false and return
    else
      flash.now[:danger] = "Please enter the correct password"
      render :index, layout: false and return
    end
  end
end

def links
  render :links, layout: false and return
end

def new
  @old_product = Product.new
  render :new, layout: false and return
end

def create
  if params[:category] != ""
  @new_product                = Product.new
  @new_product.category       = params["category"]
  @new_product.product_code   = params["product_code"]
  @new_product.name           = params["name"]
  @new_product.quantity       = params["quantity"]
  @new_product.description    = params["description"]
  @new_product.price          = params["price"]
  @new_product.image          = params["product_code"]
  @new_product.more_info      = params["more_info"]
  @new_product.percent_off      = 0
  category_id = Category.find_by(name: @new_product.category)
  @new_product.category_id    = category_id.id
    if @new_product.save == true
      render :links, layout: false and return
    end
  else
    @error = "Please fill out all the fields"
    flash.now[:danger] = "Something went wrong"
    render :new, layout: false and return
  end
end

def edit
  @old_product = Product.last
  render :edit, layout: false and return
end 

def update
  if params["commit"] == "Update"
    id = params[:product_id]
    @edit_product = Product.find(id)
    @edit_product.description = params["description"]
    @edit_product.category       = params["category"]
    @edit_product.product_code   = params["product_code"]
    @edit_product.name           = params["name"]
    @edit_product.quantity       = params["quantity"]
    @edit_product.price          = params["price"]
    @edit_product.image          = params["product_code"]
    @edit_product.more_info      = params["more_info"]
    @edit_product.percent_off      = 0
    category_id = Category.find_by(name: @edit_product.category)
    @edit_product.category_id    = category_id.id
    if @edit_product.save == true
      render :index, layout: false and return
    else
      @old_product = @edit_product
      flash.now[:danger] = "Please fill out all the fields"
      render :edit, layout: false and return
    end
  else
    if params[:commit] == "Select"
      id = params[:product_id]
      @old_product = Product.find(id)
      render :edit, layout: false and return  
    end
    
    if params[:commit] == "Delete"
    id = params[:product_id]
      @old_product = Product.find(id)
      @old_product.destroy
      render :links, layout: false and return  
    end
  end
end

def category_sale_edit
  render :category_sale, layout: false and return
end

def category_sale_edit_post
  if params[:category_name] != ""
  category_name = params[:category_name]
  @category_on_sale = CategorySale.where(category_name: category_name).first
  @category_on_sale.category_name = params[:category_name]
  @category_on_sale.percent_off   = params[:percent_off]
    if @category_on_sale.save == true
      render :links, layout: false and return
    end
  else 
    @error = "Please be sure to enter a category and percentage."
      render :category_sale, layout: false and return
  end
end

def product_sale
  render :product_sale, layout: false and return
end

def product_sale_edit_post
 if params[:product_code] != ""
  product_code = params[:product_code]
  @product_on_sale = Product.where(product_code: product_code).first
  @product_on_sale.product_code = params[:product_code]
  @product_on_sale.percent_off   = params[:percent_off]
    if @product_on_sale.save == true
      render :links, layout: false and return
    end
  else 
    @error = "Please be sure to enter a category and percentage."
      render :product_sale, layout: false and return
 end
end

def logout
  flash[:warning] = "You have been logged out.</b>".html_safe
  session.clear
  render :index, layout: false and return
end


    
    private
      def set_admin
        if Admin.find_by(username: session[:admin_user]) == nil
          render :index, layout: false and return
        end
      end

end
