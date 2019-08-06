# frozen_string_literal: true
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from(:facebook)
  end

  def google_oauth2
    callback_from(:google)
  end
  
  private
  
  def callback_from(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    
    if @user
      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
    else
      session["devise.omniauth_data"] = request.env["omniauth.auth"]
      @user = User.new()
      redirect_to new_user_registration_path
    end
  end

  def failure
    redirect_to root_path
  end
end
