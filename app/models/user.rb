class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.from_omniauth(auth)
  sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
  user = sns.user || User.where(email: auth.info.email).first_or_initialize(
    nickname: auth.info.name,
      email: auth.info.email
  )
  if user.persisted?
    sns.user = user
    sns.save
  end
  { user: user, sns: sns }
end

  has_many :sns_credentials
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_one :address, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :user_transactions, dependent: :destroy
  validates :nickname ,:password ,:family_name ,:first_name ,:family_name_kana ,:first_name_kana ,:birthday, presence: true
end
