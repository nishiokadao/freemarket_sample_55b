class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception 


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :uid, :provider])
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
      added_attrs = [ :email, :password, :password_confirmation, :name, :uid, :provider 
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

end