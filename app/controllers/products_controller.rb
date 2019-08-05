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
    @product.build_category
  end

  def create
    @product= Product.new(product_params)
    if @product.save!
      # あとで使う
      # params[:images]['image'].each do |a|
      #   @image = @product.images.create!(image: a, product_id: @product.id)
      # end
      redirect_to root_path, notice: '出品が完了しました。'
    else
      redirect_to new_product_path
    end
  end

  def buy
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :condition_id, :price, category_attributes: [:name_id, :product_id], image_attributes: [:image, :product_id], delivery_attributes: [:days_to_ship_id, :mode, :payment_id, :delivery_method,:prefecture_id]).merge(seller_id: current_user.id)
  end


end
