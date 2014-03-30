class MainController < ApplicationController

def home
  render :index and return
end

def sign_in
    render :sign_in and return
end

def sign_in_post
  if params[:commit] == "Create account"
    render :new_user and return
  end
   
  if User.find_by(username: params[:username])== nil
      flash.now[:danger] = "Username was entered incorrectly or doesn't exist. 
                          <i style='color: gray'>If you haven't done so already, please create an account below.</i>".html_safe
    render :sign_in and return
  else
      user = User.find_by(username: params[:username]) 
    if user.authenticate(params[:password]) != false 
      session[:user_name] = user.username
      flash.now[:info] = "You are logged in as: <b>#{user.username}</b>".html_safe
      render :index and return
    else
      flash.now[:danger] = "Please enter the correct password"
      render :sign_in and return
    end
  end
end

def new_user
  @user = User.new
  render :new_user and return
end

def new_user_post
  @user = User.new
  @user.username = params[:username]
  if @user.username == ""
    flash.now[:danger] = "Username can not be blank. Please try again."
    render :new_user and return
    elsif
      User.find_by(username: @user.username) != nil
      flash.now[:danger] = "Username already exists. Please try again." 
      render :new_user and return
  end
  @user.password = params[:password]
  @user.password_confirmation = params[:password_confirmation]
  if @user.password_confirmation != @user.password
    flash.now[:danger] = "There was a problem with the passwords, they must be entered and match.
                      Please try again."
    render :new_user and return
  end
  @user.email_address = params[:email_address]
  if @user.email_address == ""
    flash.now[:danger] = "Please enter an e-mail address."
    render :new_user and return
  end
  if @user.save == true
     session[:user_name] = @user.username 
     flash.now[:info] = "You are logged in as: <b>#{@user.username}</b>".html_safe
     render :index and return
  else
    if User.find_by(email_address: @user.email_address) != nil
      flash.now[:danger] = "The e-mail address entered already exists. Please try again." 
      render :new_user and return
      else
    flash.now[:danger] = "The e-mail entered is invalid, please try again."
    render :new_user and return
    end
  end
end

def edit_user
  @old_user = User.find_by(username: session[:user_name])
  render :edit_user, layout: false and return
end

def edit_user_post
  @old_user = User.find_by(username: session[:user_name])
  edit_user = User.find_by(username: params[:username])
  edit_user.username = params[:username]
  edit_user.password = params[:password]
  edit_user.password_confirmation =  params[:password_confirmation]
  if edit_user.password_confirmation != edit_user.password
    flash.now[:danger] = "There was a problem with the passwords, they must be entered and match.
                      Please try again."
    render :edit_user and return
  else
    if edit_user.save != false
      flash[:warning] = "Your password has been updated"
      render :index and return
    end
  end
end

def about
  render :about and return
end

def contact
  render :contact and return
end

def more_info_id
  id = params[:id]
  @header = "Product Detail Page"
  @product = Product.find_by(id: id)
  render :more_info and return
end

def category_sale_edit
  render :category_sale and return
end

def category_sale_edit_post
  if params[:category_name] != ""
  category_name = params[:category_name]
  @category_on_sale = CategorySale.where(category_name: category_name).first
  @category_on_sale.category_name = params[:category_name]
  @category_on_sale.percent_off   = params[:percent_off]
    if @category_on_sale.save == true
      redirect_to "/" and return
    end
  else 
    @error = "Please be sure to enter a category and percentage."
      render :category_sale and return
  end
end

def product_sale_edit
  render :product_sale and return
end

def product_sale_edit_post
 if params[:product_code] != ""
  product_code = params[:product_code]
  @product_on_sale = Product.where(product_code: product_code).first
  @product_on_sale.product_code = params[:product_code]
  @product_on_sale.percent_off   = params[:percent_off]
    if @product_on_sale.save == true
      redirect_to "/" and return
    end
  else 
    @error = "Please be sure to enter a category and percentage."
      render :product_sale and return
 end
end



def edit_old
  @old_product = Product.last
  render :edit_old, layout: false and return
end

def edit_old_post
  if params["commit"] == "Update"
    id = params[:id]
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
      redirect_to "/"
    else
      @old_product = @edit_product
      flash.now[:danger] = "Please fill out all the fields"
      render :edit_old and return
    end
  else
    if params[:commit] == "Select"
      id = params[:id]
      @old_product = Product.find(id)
      render :edit_old and return
    end
  end
end

def add_new
  @old_product = Product.new
  render :add_new, layout: false and return
end

def add_new_post
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
      redirect_to "/" and return
    end
  else
    @error = "Please fill out all the fields"
    flash.now[:danger] = "Something went wrong"
    render :add_new and return
  end
end

def product_category
  product_category = params[:product_category]
  @header = "#{product_category}"
  @products = Product.where(category: product_category)
  render :show and return
end

def log_out
  flash[:warning] = "You have been logged out. Come visit our showroom located at <b>50 Rio Grande Blvd, Denver CO</b>.".html_safe
  session.clear
  redirect_to "/" and return
end

end
