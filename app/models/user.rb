class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,

  #        :recoverable, :rememberable, :validatable
  # validates :name, presence: true

         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :products

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.uid = auth.uid
  #     user.provider = auth.provider
  #     user.name = auth.info.name
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.prefecture = "おおさか"
  #     user.address = "aaaa"
  #     user.birth_date = "1111"
  #   end
  # end
  
  def self.from_omniauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.omniauth_data"] && session["devise.omniauth_data"]["extra"]["raw_info"]
        user.name = data["name"] if user.name.blank?
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.omniauth_data"]
        user.provider = data["provider"] if user.provider.blank?
        user.uid = data["uid"] if user.uid.blank?
        user.password = Devise.friendly_token[0,20] if user.password.blank?
      end
    end
  end

end
