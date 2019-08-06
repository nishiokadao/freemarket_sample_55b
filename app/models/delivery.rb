class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation
  belongs_to_active_hash :payment


  has_one :product
  
end
