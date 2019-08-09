class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
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
  end
  
  def signout
  end 

  def item_state
    @user = User.find_by(id: current_user.id)
    @products = Product.includes(:image).where(seller_id: @user.id)
  end
  
end


