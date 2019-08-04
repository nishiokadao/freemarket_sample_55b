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
    Payjp.api_key = 'sk_test_634d5041b80a0c0fca6d2552'
    Payjp::Charge.create(
    amount:700,
    card:params['payjp-token'],
    currency:'jpy',
    )
  end
end
