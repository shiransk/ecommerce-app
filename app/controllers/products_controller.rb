class ProductsController < ApplicationController

  def index
     if params[:discount] == "Discount_Items"
       @products = Product.where("price < ?", 50)
     elsif params[:sorted]
       @products = Product.order(price: params[:sorted])
     else
       @image = Image.all
       @products = Product.all
     end
  end

  def show
    if params[:id] == "sample"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id]) 
    end
  end

  def new
  end

  def create
    name = params[:name]
    price = params[:price]
    description = params[:description]
    availability = params[:availability]
    supplier_id = params[:supplier_id]
    product = Product.new(availability: availability,name: name, price: price, description: description, supplier_id: supplier_id)
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

  def search
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:user_search]}%", "%#{params[:user_search]}%")
    render :index
  end
end

