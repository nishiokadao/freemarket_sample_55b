class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :buy, :pay, :exhibit, :destroy, :edi, :update]
  before_action :set_all_products, only: [:show, :exhibit]
  before_action :set_image, only: [:show, :buy, :pay]

  def index
    @products = Product.includes(:image).order("created_at DESC")
  end

  def show
    @user = User.find(@product.seller_id)
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
  end

  def exhibit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @product.destroy
      redirect_to item_state_users_path
    else
      render 'exhibit'
    end
  end

  def buy
    ## payjp情報
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
    amount: @product.price, 
    customer: credit.payjp_id, 
    currency: 'jpy'
    )
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_image
    @image = Image.find_by(product_id:@product.id)
  end
  
  def set_all_products
    @images = Image.where(product_id: @product.id)
    @user = User.find(@product.seller_id)
  end

  def product_params
    params.require(:product).permit(:name, :description, :condition_id, :price, :status, category_attributes: [:name_id, :product_id], image_attributes: [:image, :product_id], delivery_attributes: [:days_to_ship_id, :mode, :payment_id, :delivery_method, :prefecture_id, :mode]).merge(seller_id: current_user.id)
  end
end
