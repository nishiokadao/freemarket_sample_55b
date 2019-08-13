class Image < ApplicationRecord

  belongs_to :product
  mount_uploader :image, ImageUploader
  validates_associated :product
  validates :image, presence: true


  
end
