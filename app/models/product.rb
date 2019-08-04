class Product < ApplicationRecord
  belongs_to :user, optional: true
  has_one :image
  has_one :delivery
  accepts_nested_attributes_for :image
  accepts_nested_attributes_for :delivery
  has_many :category_products
  has_many :categories, through: :category_products

end
