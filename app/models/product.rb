class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  # belongs_to_active_hash :tradestatus


  belongs_to :user, optional: true
  has_one :image, dependent: :destroy
  has_one :delivery, dependent: :destroy 
  has_one :category, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  accepts_nested_attributes_for :image ,update_only: true
  accepts_nested_attributes_for :delivery, update_only: true
  accepts_nested_attributes_for :category, update_only: true

  validates :name, :status, :description, :price, :condition_id, presence: true
  validates :image, presence: true


  def self.search(search)
    return Product.all unless search
    Product.where(['name LIKE ?', "%#{search}%"])
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  # scope :index_category,-> (num){
  #     index_category = Category.where(name_id: num).order("created_at DESC")
  #     index_category.map do |p|
  #       p.product
  #     end
  # }

end
