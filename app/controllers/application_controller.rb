class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :calculate_cart_count 

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

  def calculate_cart_count 
    if current_user && current_user.orders.find_by(completed: false)
      if session[:cart_count]
        @cart_count = session[:cart_count]
      else     
        @cart_count = 0
        current_user.orders.find_by(completed: false).carted_products.each do |carted|
          @cart_count +=  carted.quantity
        end 
        session[:cart_count] = @cart_count
      end  
    else
      @cart_count = 0
    end
   end 
end
