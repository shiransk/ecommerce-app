class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end 

  def autenticate_admin
    if current_user && current_user.admin 
      #do nothing
    else
      flash[:danger] = "Go away stupid!!!!!"
      redirect_to '/'
    end
  end

  def autenticate_user
    if !current_user
      flash[:danger] = "Must login"
      redirect_to '/login'
    end
  end

end
