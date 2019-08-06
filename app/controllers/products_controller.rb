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
    @product = Product.find(1)
    @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
    Payjp.api_key = 'sk_test_634d5041b80a0c0fca6d2552'
    customer = Payjp::Customer.retrieve(@credit.payjp_id)
    @default_credit_info = customer.cards.retrieve(@credit.card_id)
    @card_nam = @default_credit_info.last4
    @exp_month = @default_credit_info.exp_month
    @exp_year = @default_credit_info.exp_year.to_s.slice(2,3)
  end

  def pay
    credit = Credit.where(user_id: current_user.id).first
    Payjp.api_key = 'sk_test_634d5041b80a0c0fca6d2552'
    Payjp::Charge.create(
    amount: 13500, 
    customer: credit.payjp_id, 
    currency: 'jpy'
    )
    rescue Payjp::CardError
      redirect_to buy_product_path, notice: "削除しました"
  end

  private 
  def product_params
    params.require(:product).permit(:name, :description, :condition, :price, category_attributes: [:id, :name], image_attributes: [:id, :image, :product_id], delivery_attributes: [:id, :days_to_ship, :mode, :delivery_method,:shipping_place]).merge(seller_id: current_user.id)
  end
end
