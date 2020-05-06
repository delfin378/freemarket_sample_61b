class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :securitycord ,presence: true
end

