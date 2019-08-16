class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
  end

  def select_sign_up
  end

  def sign_up_second
  end

  def sign_up_third
  end

  def sign_up_forth
  end

  def sign_up_fifth
  end

  def detail
  end

  def profile
  end

  def credit
    @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
  end
  
  def signout
  end 

  def item_state
    @products = Product.includes(:images).where(seller_id: current_user)
  end
end


