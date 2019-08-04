class ProductsController < ApplicationController
  def index
    @products =Product.all
  end

  def show
    
  end
  
  def new
    @product = Product.new
    @product.build_image
    # あとで使う    2.time{@product.images.build}
    @product.build_delivery
    @product.categories.build
  end

  def create
    @product= Product.new(product_params)
    if @product.save!
      # あとで使う
      # params[:images]['image'].each do |a|
      #   @image = @product.images.create!(image: a, product_id: @product.id)
      # end
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
