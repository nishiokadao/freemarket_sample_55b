class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation
  belongs_to_active_hash :payment

  belongs_to :product
  validates_associated :product
  validates :payment_id, :prefecture_id, :days_to_ship_id, :mode,  presence: true

  
end
