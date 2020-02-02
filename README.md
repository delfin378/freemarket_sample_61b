# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|e-mail|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|integer|null: false|
|phone_number|string|null: false| 
|profile|text|null: true|
|icon|text||

### Association 
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :user-transactions, dependent: :destroy

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreing_key:true|
|name|string|null: false| 
|name_kana|string|null: false| 
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|house_number|string|null: false|
|building_name|string|null: true|
|phone_number|integer|null: false|

### Association
- has_many :transactions, dependent: :destroy
- belong_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false, foreign_key: true|
|expiration_date|integer|null: false| 
|securitycord|integer|null: false| 

### Association
- belongs_to : user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false|
|price|integer|null: false|
|item_explanation|text|null: false|
|category|integer|null: false| 
|product_situation(商品の状態)|string|| 
|shipping_charges(配送料の負担)|integer|null: false| 
|shipping_method(発送方法)|string|null: false|
|shipping_origin(発送元)|integer|null: false| 
|arrival_days(到着日数)|integer|| 

### Association
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer| null: false, foreign_key: true|
|image|string|null: false|

### Association
- belong_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|


### Association
- belong_to :user
- belong_to :item

## transactionテーブル
|Column|Type|Options|
|------|----|-------|
|items_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|address_id|integer|null: false, foreign_key: true|
|date|integer|null: false|
|transaction_status_id|integer|null: false, foreign_key: true|

### Association
- has_many :transaction_messages
- has_many :transaction_status
- has_many :user_transactions

## transaction_message
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|transaction_id|integer|null: false, foreign_key: true|
|transaction_date|integer|null: false|
|text|string||

### Association
- has_many :users
- has_many :transactions

## transaction_statusテーブル
|Column|Type|Options|
|------|----|-------|
|transaction_id|integer|null: false, foreign_key: true|
|transaction_status_date|integer|null: false|
|situation|string|null: false|

### Association
- belong_to :transaction

## user_transactionテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|transaction_id|integer|null: false, foreign_key: true|

### Association
- belong_to :user
- belong_to :transaction