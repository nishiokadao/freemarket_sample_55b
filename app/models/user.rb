class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,

  #        :recoverable, :rememberable, :validatable
  # validates :name, presence: true

         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :products

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.uid = auth.uid
      user.provider = auth.provider
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.prefecture = "おおさか"
      user.address = "aaaa"
      user.birth_date = "1111"
    end
  end
end
