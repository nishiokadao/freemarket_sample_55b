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

  validates :name, :status, :description, :price, :condition_id, presence: true
  validates :image, presence: true


end
