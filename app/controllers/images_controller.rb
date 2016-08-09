class ImagesController < ApplicationController
  def new
  end

  def create
    url = params[:url]
    product_id = params[:product][:product_id]
    puts "below"
    p product_id
    image = Image.new(url: url , product_id: product_id)
    image.save
    redirect_to "/products/#{image.product.id}"
  end

  def destroy
    image = Image.find_by(id: params[:id])
    image.destroy
    flash[:danger] = "Photo deleted!"
    redirect_to "/products/#{image.product.id}"
  end
end
