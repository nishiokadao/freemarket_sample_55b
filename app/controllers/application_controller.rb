class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birth_date, :address, :prefecture])
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected

    def configure_permitted_parameters
      # sign_upのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :prefecture, :address, :birth_date])
      # account_updateのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
    end

end