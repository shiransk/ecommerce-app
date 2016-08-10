class ProductsController < ApplicationController

  before_action :autenticate_admin, except: [:index, :show, :search]
 
  def index
     if params[:discount] == "Discount_Items"
       @products = Product.where("price < ?", 50)
     elsif params[:sorted]
       @products = Product.order(price: params[:sorted])
     elsif params[:category_id]
       @products = Category.find_by(id: params[:category_id]).products
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
    @product = Product.new #go over concept
  end

  def create
      name = params[:name]
      price = params[:price]
      description = params[:description]
      availability = params[:availability]
      supplier_id = params[:supplier_id]
      @product = Product.new( availability: availability,name: name, price: price, description: description, supplier_id: params[:supplier][:supplier_id])
      # binding.pry
      if @product.save
        flash[:success] = "Product Created"
        redirect_to "/products/#{product.id}"
      else
        flash[:danger] = "Product not Created"
        render :new
      end

  end

  def edit
      @product = Product.find_by(id: params[:id])
  end

  def update
      @product = Product.find_by(id: params[:id])
      @product.name = params[:name]
      @product.price = params[:price]
      @product.description= params[:description]
      @product.availability = params[:availability]
      if @product.save
        flash[:success] = "Product edited"
        redirect_to "/products/#{@product.id}"
      else flash[:danger] = "Product Not Updated!!!"
        render :edit
      end     
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

