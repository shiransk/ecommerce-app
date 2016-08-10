class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :calculate_cart_count
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

      order = Order.find_by(completed: false) 
      carts = order.carted_products 
      count = 0

      carts.each do |cart|
        count += cart.quantity
      end
      # binding.pry
      return count
    end
  end
end
