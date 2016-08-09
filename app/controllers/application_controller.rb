class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end 

  def check_if_admin
    if current_user && current_user.admin 
      #do nothing
    else
      flash[:danger] = "Go away stupid!!!!!"
      redirect_to '/'

    end
  end

end
