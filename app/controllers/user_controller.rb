class UserController < ApplicationController

def index
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

def edit
  @old_user = User.find_by(username: session[:username])
  render :edit and return
end

def update
  if params[:commit] == "Update Username"
    edit_user = User.find_by(username: session[:username])
    edit_user.username = params[:username]
    session[:username] = edit_user.username
    edit_user.save!
    redirect_to "/" and return
  else
  @old_user = User.find_by(username: session[:username])
  edit_user = User.find_by(username: params[:username])
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
      redirect_to "/" and return
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
  @user = User.find_by(username: session[:username])
end

def logout
  flash[:warning] = "You have been logged out. Come visit our showroom located at <b>50 Rio Grande Blvd, Denver CO</b>.".html_safe
  session.clear
  redirect_to "/" and return
end

end
