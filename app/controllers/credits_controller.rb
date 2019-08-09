class CreditsController < ApplicationController
  require "payjp"
  before_action :set_credit

  def new 
    credit = Credit.where(user_id: current_user.id).first
    redirect_to action: "index" if credit.present?
  end

  def index
    if @credit.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = 'sk_test_634d5041b80a0c0fca6d2552'
      customer = Payjp::Customer.retrieve(@credit.payjp_id)
      @default_credit_info = customer.cards.retrieve(@credit.card_id)
      @card_nam = @default_credit_info.last4
      @exp_month = @default_credit_info.exp_month
      @exp_year = @default_credit_info.exp_year.to_s.slice(2,3)
    end
  end

  def create 
    Payjp.api_key = 'sk_test_634d5041b80a0c0fca6d2552'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      )
      @credit = Credit.new(user_id: current_user.id, payjp_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  def destroy
    Payjp.api_key = 'sk_test_634d5041b80a0c0fca6d2552'
    customer = Payjp::Customer.retrieve(@credit.payjp_id)
    customer.delete
    if @credit.destroy
      redirect_to credit_users_path, notice: "削除しました"
    else
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  private

  def set_credit
    @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
  end


end
