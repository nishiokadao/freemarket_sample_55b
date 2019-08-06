class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images)
  end

  def show
    @product = Product.find(params[:id])
    @images = Image.where(product_id: params[:id])
    @user = User.find(params[:id])
  end
  
  def new
    
  end

  def buy
  
  end
end
