class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  # belongs_to_active_hash :tradestatus


  belongs_to :user, optional: true
  has_one :image
  has_one :delivery
  has_one :category
  accepts_nested_attributes_for :image ,update_only: true
  accepts_nested_attributes_for :delivery, update_only: true
  accepts_nested_attributes_for :category, update_only: true

  # mount_uploader :image, ImageUploader
  # enum :status, {"出品中": 0}

  def self.search(search)
    return Product.all unless search
    Product.where(['name LIKE ?', "%#{search}%"])
  end


end
