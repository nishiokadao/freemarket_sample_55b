class Image < ApplicationRecord
  has_one :product
  mount_uploader :image, ImageUploader

end
