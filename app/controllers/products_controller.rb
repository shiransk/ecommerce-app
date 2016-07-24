class ProductsController < ApplicationController

  def products
   @products = Product.all
  end
  
end

