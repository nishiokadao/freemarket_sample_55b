# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from(:facebook)
  end

  def google_oauth2
    callback_from(:google)
  end
  
  private
  
  #共通の設定
  def callback_from(provider)
    # provider = provider.to_s
    # @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user
      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      @user = User.new()
      redirect_to first_users_path
      # render 'users/first'
    end
  end
  
  #   if @user.persisted?
  #     flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     #各providerごとにふりわけ
  #     session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
  #     redirect_to new_user_registration_url
  #   end
  # end

  def failure
    redirect_to root_path
  end
end
