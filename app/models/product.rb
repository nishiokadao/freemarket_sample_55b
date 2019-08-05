class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition

  belongs_to :user, optional: true
  has_one :image
  has_one :delivery
  has_one :category
  accepts_nested_attributes_for :image
  accepts_nested_attributes_for :delivery
  accepts_nested_attributes_for :category

end
