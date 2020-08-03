class UsersController < ApplicationController

  def sign_in
    @user = User.new
  end

  def sign_up
    @user = User.new
  end

  def login
    if user_params[:account] && user_params[:password]
      user = User.login(user_params)
      if user
          signed_in_user(user)
          redirect_to root_path, notice: "successfully sign_in"

      else
        redirect_to sign_in_users_path, notice: "please enter correct password"
      end
    else
      redirect_to sign_in_users_path, notice: "please enter correct password"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in_user_user(u)
      redirect_to root_path,notice: 'successfully signed_up'
    else
      render :sign_up
    end
  end

  def sign_out
    sign_out_user
    redirect_to root_path, notice: "successfully sign-out"
  end
  

  private 

  def sign_in_user(u)
    session[:user_token] = u.id
  end

  def sign_out_user(u)
    session[:user_token] = nil
  end
  
  def user_params
    params.require(:user).permit(:account, :password, :email)
  end
  
  
end
