class CartedProductsController < ApplicationController

  def index
    @order = Order.find_by(completed: false)
    if !@order || !@order.carted_products
      flash[:info] = "No items in cart"
      redirect_to '/'
    end
  end
 
  def create 
    order = Order.find_by(completed: false)

    if order == nil
      order = Order.new(user_id: current_user.id , completed: false)
      order.save
    end

    carted_products = CartedProduct.new(product_id: params[:product_id], quantity: params[:quantity], order_id: order.id)
    if carted_products.save
      redirect_to '/carted_products'
    else
      flash[:danger] = "Eror"
    end

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

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id]).delete
    flash[:warning] = "#{carted_product.product.name} Removed from Cart!!!"
    redirect_to '/carted_products'
  end

end
