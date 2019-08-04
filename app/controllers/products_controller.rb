class ProductsController < ApplicationController
  def index
    @products =Product.all
  end

  def show
    
  end
  
  def new
    
  end

  def buy
    @product = Product.find(1)
  end

  def pay
    Payjp.api_key = ENV['PAYJ_SECRET_KEY']
    Payjp::Charge.create(
    amount:700,
    card:params['payjp-token'],
    currency:'jpy',
    )
  end
end
