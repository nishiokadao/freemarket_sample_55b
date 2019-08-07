class Image < ApplicationRecord

  belongs_to :product

  # has_one :product
  mount_uploader :image, ImageUploader

end
