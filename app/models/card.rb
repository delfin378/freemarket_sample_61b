class Card < ApplicationRecord
  belongs_to :user, optional: true
  validates :card_number ,:expiration_year ,:expiration_month ,:securitycord ,presence: true

  enum expiration_month:{start_month:1, end_month:12}
  enum expiration_year:{start_year:20, end_year:30}
end

