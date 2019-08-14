class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  validates :name, presence: true

  has_many :products
  has_many :credits
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product

  def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first
  end
  
  def self.new_with_session(params, session)   
    super.tap do |user|
      if data = session["devise.omniauth_data"] && session["devise.omniauth_data"]["info"]
        user.name = data["name"] if user.name.blank?
        user.email = data["email"] if user.email.blank?
      end
      if data = session["devise.omniauth_data"]
        user.password = Devise.friendly_token[0,20] if user.password.blank?
        user.provider = data["provider"] if user.provider.blank?
        user.uid = data["uid"] if user.uid.blank?
      end
    end
  end

end
