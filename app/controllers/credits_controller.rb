class CreditsController < ApplicationController


  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    credit = Credit.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end

  def index
    
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = ENV['PAYJ_SECRET_KEY']

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
      )
      @credit = Credit.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @credit.save
        redirect_to action: "index"
      else
        redirect_to action: "create"
      end
    end
  end

  private

  def set_credit
    # @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
  end


end
