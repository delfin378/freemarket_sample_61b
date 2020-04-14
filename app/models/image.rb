class Image < ApplicationRecord
  mount_uploader :src, ImageUploader
  
  #アソシエーション
  belongs_to :product, optional: true
end
