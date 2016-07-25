class ProductsController < ApplicationController

  def index
   @products = Product.all
  end

  def show
    #get specific product
    id = params[:id]
    @product = Product.find_by(id: id)
    # @product = Product.find(params[:id])
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
    @id = params[:id]
    # @product = Product.find_by(id: id)
  end

  def update
  end

  
end

