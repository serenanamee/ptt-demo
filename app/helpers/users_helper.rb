module UsersHelper

  def user_signed_in?
    session[:user_token]
  end
  
  def current_user
    User.find(session[:user_token]) if user_signed_in?
  end
  
end
