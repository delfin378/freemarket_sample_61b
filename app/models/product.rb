class Product < ApplicationRecord
  has_many :comments
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, length: { in: 1..40 }, presence: true
  validates :product_explanation, length: { in: 1..1000 }, presence: true
  validates :price, presence: true, numericality: { only_integer: true,greater_than: 299, less_than: 10000000}
  belongs_to :user, optional: true
  
  enum category:{"レディース":1,"メンズ":2,"キッズ":3,"インテリア・小物":4,"おもちゃ・ホビー":5,"香水・美容":6,"家電・スマホ":7,"スポーツ・レジャー":8,"ハンドメイト":9,"自転車・バイク":10,"その他":11}
  enum product_situations:{"新品、未使用":1,"未使用に近い":2,"目立った傷や汚れなし":3,"やや傷や汚れあり":4,"傷や汚れあり":5,"全体的に状態が悪い":6}
  enum shipping_charges:{"送料込み(出品者負担)":1,"着払い(購入者負担)":2}
  enum shipping_origin:{"北海道":1,"東北":2,"関東":3,"中部":4,"関西":5,"四国":6,"中国":7,"九州":8,"沖縄":9}
  enum trade_status:{"出品中":1, "交渉中":2,"出品停止中":3}
  enum arrival_days:{"1~2日":1,"3~4日":2,"5~7日":3,"10日以内":4}
  
end
