class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, :family_name_kana ,:first_name, :first_name_kana, :prefectures, :municipalities, :house_number, :building_name, :postal_code, :house_phone_number ,presence: true
end

