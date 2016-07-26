class ProductsController < ApplicationController

  def index
   @products = Product.all
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
    product = Product.new(name: name, price: price, description: description, image: image_url)
    product.save
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
    product.save
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
  end

  
end

