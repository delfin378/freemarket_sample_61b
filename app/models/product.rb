class Product < ApplicationRecord
  has_many :comments
  has_many :images, dependent: :destroy
  enum trade_status:[ :selling, :negotiating, :freeze]
  accepts_nested_attributes_for :images, allow_destroy: true
end
