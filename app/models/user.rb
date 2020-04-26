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
  validates :password ,:nickname ,:family_name ,:first_name ,:family_name_kana ,:first_name_kana ,:phone_number ,:profile ,:icon ,:birth_year ,:birth_month ,:birth_date ,presence: true

  enum birth_year:{start_year:2020, end_year:1900}
  enum birth_month:{start_month:1, end_month:12}
  enum birth_date:{start_date:1, end_date:31}
end
