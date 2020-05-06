class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :user_transactions, dependent: :destroy
  validates :nickname ,:family_name ,:first_name ,:family_name_kana ,:first_name_kana ,:phone_number ,presence: true
end
