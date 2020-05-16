class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :securitycord, :expiration_date ,presence: true
end

