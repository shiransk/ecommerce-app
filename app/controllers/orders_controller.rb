class OrdersController < ApplicationController
  before_action :autenticate_user
  
  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
    order = Order.find_by(completed: false)

    total_subtotal = 0
    total_tax = 0

    order.carted_products.each do |carted_product|
    # binding.pry
      
      total_subtotal += (carted_product.product.price * carted_product.quantity)
      total_tax += (carted_product.product.tax * carted_product.quantity)
    end
    total = total_tax + total_subtotal
    order.assign_attributes(completed: true, subtotal: total_subtotal, total: total, tax: total_tax, user_id: current_user.id)
    order.save
    redirect_to "/orders/#{order.id}"

   end

end
