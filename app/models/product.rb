class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  # belongs_to_active_hash :tradestatus


  belongs_to :user, optional: true
  has_one :image, dependent: :destroy
  has_one :delivery, dependent: :destroy 
  has_one :category, dependent: :destroy
  accepts_nested_attributes_for :image ,update_only: true
  accepts_nested_attributes_for :delivery, update_only: true
  accepts_nested_attributes_for :category, update_only: true

  # mount_uploader :image, ImageUploader
  # enum :status, {"出品中": 0}

end
