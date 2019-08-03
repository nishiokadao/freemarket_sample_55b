class Product < ApplicationRecord
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images
  has_one :delivery
  accepts_nested_attributes_for :delivery
  has_many :category_products
  has_many :categories, through: :category_products
end
