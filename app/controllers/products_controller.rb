class ProductsController < ApplicationController
  def index
    @products =Product.all
  end

  def show
    
  end
  
  def new
    @product = Product.new
    @product.build_image
    @product.categories.build
    @product.build_delivery
  end

  def create
    @product= Product.new(product_params)
    if @product.save!
      # delivery_id = Delivery.find(@product.id).id       #作成したdeliveryのIDを取り出す
      # product = Product.find(@product.id)               #作成したItemのidを取り出す
      # product.update(delivery_id: delivery_id)          #productテーブルにderivery_idのカラムを入れる
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def buy
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :condition, :price, category_attributes: [:id, :name], image_attributes: [:id, :image, :product_id], delivery_attributes: [:id, :days_to_ship, :mode, :delivery_method,:shipping_place]).merge(seller_id: current_user.id)
  end


end
