class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  # belongs_to_active_hash :tradestatus


  belongs_to :user, optional: true
  has_many :images, dependent: :destroy
  has_one :delivery, dependent: :destroy 
  has_one :category, dependent: :destroy
  accepts_nested_attributes_for :images ,update_only: true
  accepts_nested_attributes_for :delivery, update_only: true
  accepts_nested_attributes_for :category, update_only: true

  validates :name, :status, :description, :price, :condition_id, presence: true
  validates :image, presence: true


  def self.search(search)
    return Product.all unless search
    Product.where(['name LIKE ?', "%#{search}%"])
  end


end
