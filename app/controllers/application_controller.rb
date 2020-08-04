class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  helper_method :user_signed_in?, :current_user

private
  

def not_found
   render file: '/public/404.html', status: 404
end

def user_signed_in?
  current_user != nil
end

def current_user
    @current_user ||= User.find_by(id: session[:user_token])
end

def authenticate_user!
  redirect_to root_path, notice: "請登入會員" if not user_signed_in?
end


end
