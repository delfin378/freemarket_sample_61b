class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :expiration_date  ,:securitycord ,presence: true
end

