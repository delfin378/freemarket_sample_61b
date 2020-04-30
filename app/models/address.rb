class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  validates :prefectures, :municipalities, :house_number, :building_name, :postal_code, :house_phone_number ,presence: true
end

