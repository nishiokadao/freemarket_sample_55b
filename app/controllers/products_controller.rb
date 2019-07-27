class ProductsController < ApplicationController
  def index
    @products = products.includes(:user).order("created_at DESC")
  end
end
