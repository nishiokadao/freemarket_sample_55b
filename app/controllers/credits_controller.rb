class CreditsController < ApplicationController
  require "payjp"
  before_action :set_credit

  def new 
    credit = Credit.where(user_id: current_user.id).first
    redirect_to action: "index" if credit.present?
  end

  def index
    if @card.present?
      Payjp.api_key = 'sk_test_634d5041b80a0c0fca6d2552'
      customer = Payjp::Customer.retrieve(@card.payjp_id)
      @card_information = customer.cards.retrieve(@card.card_id)
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
      binding.pry
      @credit = Credit.new(user_id: current_user.id, payjp_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  private

  def set_credit
    @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
  end


end
