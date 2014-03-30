class NewUserController < ApplicationController

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

end
