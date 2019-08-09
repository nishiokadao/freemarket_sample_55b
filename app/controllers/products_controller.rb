class ProductsController < ApplicationController
  before_action :set_all_products, only: [:show, :exhibit]
  
  def index
    @products = Product.includes(:image).order("created_at DESC")
  end

  def show
  end
  
  def new
    @product = Product.new
    @product.build_image
    @product.build_delivery
    @product.build_category
  end

  def create
    @product= Product.new(product_params)
    if @product.save!
      redirect_to root_path, notice: '出品が完了しました。'
    else
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end

  def buy
    @product = Product.find(1)
    @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.retrieve(@credit.payjp_id)
    @default_credit_info = customer.cards.retrieve(@credit.card_id)
    @card_nam = @default_credit_info.last4
    @exp_month = @default_credit_info.exp_month
    @exp_year = @default_credit_info.exp_year.to_s.slice(2,3)
  end

  def pay
    credit = Credit.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
    amount: 700, 
    customer: credit.payjp_id, 
    currency: 'jpy'
    )
    rescue Payjp::CardError
      redirect_to buy_product_path, notice: "削除しました"
  end

  def exhibit
  end

  private
  
  def set_all_products
    @product = Product.find(params[:id])
    @images = Image.where(product_id: @product.id)
    @user = User.find(@product.seller_id)
  end

  def product_params
    params.require(:product).permit(:name, :description, :condition_id, :price, :status, category_attributes: [:name_id, :product_id], image_attributes: [:image, :product_id], delivery_attributes: [:days_to_ship_id, :mode, :payment_id, :delivery_method, :prefecture_id, :mode]).merge(seller_id: current_user.id)
  end
end
