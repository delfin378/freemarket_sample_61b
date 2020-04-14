class Product < ApplicationRecord
  has_many :comments
  has_many :images, dependent: :destroy
  # belongs_to :user
  enum trade_status:{selling: 0, negotiating: 1, freeze: 2}
  accepts_nested_attributes_for :images, allow_destroy: true
end
