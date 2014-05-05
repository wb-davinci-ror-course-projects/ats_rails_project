class UserController < ApplicationController

def index
  if params[:page] != nil
    @product = Product.find(params[:page])
  end
  render :index and return
end

def sign_in
  if params[:commit] == "Create account"
    render :new and return
  end
   
  if User.find_by(username: params[:username])== nil
      flash[:danger] = "Username was entered incorrectly or doesn't exist. 
                        <i style='color: gray'>If you haven't done so already, please create an account below.</i>".html_safe
    render :index and return
  else
      user = User.find_by(username: params[:username]) 
    if user.authenticate(params[:password]) != false 
      session[:username] = user.username
      flash[:info] = "You are logged in as: <b>#{user.username}</b>".html_safe
      redirect_to "/" and return
    else
      flash.now[:danger] = "Please enter the correct password"
      render :index and return
    end
  end
end

def email
  render :email and return
end

def send_email
  session[:email] = params[:email]
  user = User.find_by(email_address: session[:email])
  link = reset_password_url(user.id, user.email_verification_token)
    Pony.mail(
      to:        session[:email],
      subject:   "Reset Password Link",
      body:      "If the link below doesn't work you can copy and paste this url: #{link}.",
      html_body: "Please click this link  <b>#{link}</b> to reset your password."
    )
  flash.now[:info] = "An e-mail has been sent, please use the link provided to reset
                      your password."
  render :email and return
end

def reset
  render :reset and return
end

def reset_password
  user = User.find_by(email_address: session[:email])
  user.password               = params[:password]
  user.password_confirmation  = params[:password_confirmation] 
  if user.password == user.password_confirmation
    user.save!
    flash[:info] = "Your password has been updated"
    redirect_to user_signin_path and return
  else
    flash.now[:danger] = "Both passwords must match."
    render :reset and return
  end
end

def edit
  @old_user = User.find_by(username: session[:username])
  render :edit and return
end

def update_user
  if params[:commit] == "Update Username"
    edit_user = User.find_by(username: session[:username])
    edit_user.username = params[:username]
    session[:username] = edit_user.username
    if edit_user.save == true
      redirect_to home_page_path and return
    else
      flash.now[:danger] = "Username is already taken, please try another"
      @old_user = User.find_by(username: session[:username])
      render :edit and return
    end
   elsif params[:commit] == "Update E-mail"
      edit_user = User.find_by(username: session[:username])
      edit_user.email_address = params[:email_address]
     if edit_user.save == true
      redirect_to home_page_path and return
    else
      flash.now[:danger] = "An account with that e-mail already exists"
      @old_user = User.find_by(username: session[:username])
      render :edit and return
    end
  else
    @old_user = User.find_by(username: session[:username])
    edit_user = User.find_by(username: session[:username])
    edit_user.username = params[:username]
    edit_user.password = params[:password]
    edit_user.password_confirmation =  params[:password_confirmation]
    if edit_user.password_confirmation != edit_user.password
      flash.now[:danger] = "There was a problem with the passwords, they must be entered and match.
                           Please try again."
      render :edit and return
    else
      if edit_user.save != false
        flash[:warning] = "Your password has been updated"
        redirect_to home_page_path and return
      end
    end
  end
end

def new
  @user = User.new
  render :new and return
end

def create
  @user = User.new
  @user.username = params[:username]
  if @user.username == ""
    flash.now[:danger] = "Username can not be blank. Please try again."
    render :new and return
    elsif
      User.find_by(username: @user.username) != nil
      flash.now[:danger] = "Username already exists. Please try again." 
      render :new and return
  end
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
  if @user.password_confirmation != @user.password
    flash.now[:danger] = "There was a problem with the passwords, they must be entered and match.
                      Please try again."
    render :new and return
  end
    @user.email_address = params[:email_address]
  if @user.email_address == ""
    flash.now[:danger] = "Please enter an e-mail address."
    render :new and return
  end
  if @user.save == true
     session[:username] = @user.username 
     flash[:info] = "You are logged in as: <b>#{@user.username}</b>".html_safe
     redirect_to "/" and return
  else
    if User.find_by(email_address: @user.email_address) != nil
      flash.now[:danger] = "The e-mail address entered already exists. Please try again." 
      render :new and return
      else
    flash.now[:danger] = "The e-mail entered is invalid, please try again."
    render :new and return
    end
  end
end

def ship_bill_info
  if Cart.find_by(cart_id: session[:cart_id]) == nil
      flash[:danger] = "There is nothing in the cart to order"
      redirect_to home_page_path and return
    end
  if session[:username] == nil
    flash.now[:info] = "Please sign in or create account and return to view cart."
    render :index and return
  else
    @user = User.find_by(username: session[:username])
  end
end

def update_ship
  if params[:commit] == "yes"
    session[:bill_same] = params[:commit]
    @user = User.find_by(username: session[:username])
    flash.now[:warning] = "Please enter or update shipping information, if needed.
                        <i>Then continue.</i>".html_safe
    render :ship_bill_same and return
  elsif params[:commit] == "no"
    session[:bill_same] = params[:commit]
    @user = User.find_by(username: session[:username])
    flash.now[:warning] = "Please enter or update shipping and billing information, if needed.
                    <i>Then continue.</i>".html_safe
    render :ship_bill_info and return
  end
    edit_user = User.find_by(username: session[:username])
    edit_user.company_name          = params[:company_name]
    edit_user.shipping_first_name   = params[:shipping_first_name]
    edit_user.shipping_last_name    = params[:shipping_last_name]
    edit_user.shipping_address1     = params[:shipping_address1]
    edit_user.shipping_address2     = params[:shipping_address2]
    edit_user.shipping_city         = params[:shipping_city]
    edit_user.shipping_state        = params[:shipping_state]
    edit_user.shipping_zip          = params[:shipping_zip]
    edit_user.shipping_phone_number = params[:shipping_phone_number]
  if session[:bill_same] == "yes"
    edit_user.billing_first_name    = params[:shipping_first_name]
    edit_user.billing_last_name     = params[:shipping_last_name]
    edit_user.billing_address1      = params[:shipping_address1]
    edit_user.billing_address2      = params[:shipping_address2]
    edit_user.billing_city          = params[:shipping_city]
    edit_user.billing_state         = params[:shipping_state]
    edit_user.billing_zip           = params[:shipping_zip]
    edit_user.billing_phone_number  = params[:shipping_phone_number]
  else
    edit_user.billing_first_name    = params[:billing_first_name]
    edit_user.billing_last_name     = params[:billing_last_name]
    edit_user.billing_address1      = params[:billing_address1]
    edit_user.billing_address2      = params[:billing_address2]
    edit_user.billing_city          = params[:billing_city]
    edit_user.billing_state         = params[:billing_state]
    edit_user.billing_zip           = params[:billing_zip]
    edit_user.billing_phone_number  = params[:billing_phone_number]
  end
    edit_user.save!
  if params[:shipping_address1] == "" || params[:shipping_zip]  == "" 
       flash.now[:danger] = "Street address, city, state and zip code information is required."
       @user = User.find_by(username: session[:username])
       render :ship_bill_info and return
    elsif params[:shipping_city] == "" || params[:shipping_state]  == "" 
      flash.now[:danger] = "Street address, city, state and zip code information is required."
      @user = User.find_by(username: session[:username])
      render :ship_bill_info and return
  end 
    redirect_to final_cart_path and return
end

def user_orders
  @past_order = Order.where(user_id: User.find_by(username: session[:username]).id).last
  render :orders and return
end

def past_order
  @past_order = Order.find_by(order_number: params[:order_number])
  render :orders and return
end

def logout
  flash[:warning] = "You have been logged out. Come visit our showroom located at <b>50 Rio Grande Blvd, Denver CO</b>.".html_safe
    Cart.where(cart_id: session[:cart_id]).each do |c|
      @product = Product.find_by(id: c.product_id)
      @product.quantity = @product.quantity.to_i + c.quantity
      @product.save!
      c.delete
      end
    session.clear
  redirect_to "/" and return
end

end
