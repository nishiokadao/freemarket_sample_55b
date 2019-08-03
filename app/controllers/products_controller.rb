class ProductsController < ApplicationController
  def index
    @products =Product.all
  end

  def show
    @product = Product.find(id: params[:id])
  end
  
  def new
    
  end

  def buy
  
  end
end
