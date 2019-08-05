class ProductsController < ApplicationController
  def index
    @products =Product.all
  end

  def show
    @product = product.find(params[id])
  end
  
  def new
    
  end

  def buy
    @product = Product.find(1)
  end

  def pay
    begin
      Payjp.api_key = ENV['PAYJ_SECRET_KEY']
      Payjp::Charge.create(
      amount:700,
      card:params['payjp-token'],
      currency:'jpy',
      )
    rescue => exception
      redirect_to  buy_products_path
    end
    
  end

  private 
  def product_params
    params.require(:product).permit(:name, :description, :condition, :price, category_attributes: [:id, :name], image_attributes: [:id, :image, :product_id], delivery_attributes: [:id, :days_to_ship, :mode, :delivery_method,:shipping_place]).merge(seller_id: current_user.id)
  end


end
