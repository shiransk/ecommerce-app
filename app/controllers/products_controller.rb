class ProductsController < ApplicationController

  def index
     if params[:discount] == "Discount_Items"
       @products = Product.where("price < ?", 50)
     elsif params[:sorted_reverse] == "asc"
       @products = Product.order(price: :desc)
     elsif params[:sorted] = "desc"
       @products = Product.order(:price)
     else
       @products = Product.all
     end
  end

  def show
   @product = Product.find_by(id: params[:id]) 
  end

  def new
  end

  def create
    name = params[:name]
    price = params[:price]
    description = params[:description]
    image_url = params[:image]
    availability = params[:availability]
    product = Product.new(availability: availability,name: name, price: price, description: description, image: 
    image_url)
    product.save
    flash[:success] = "Product Created"
    redirect_to "/products/#{product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name]
    product.price = params[:price]
    product.description= params[:description]
    product.image = params[:image]
    product.availability = params[:availability]
    product.save
    flash[:success] = "Product edited"
    redirect_to "/products"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:danger] = "Product destroed"
    redirect_to "/products"
  end

  # def popular_products
  # end
  
end

