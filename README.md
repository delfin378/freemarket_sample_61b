# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|

### Association 
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_one :address, dependent: :destroy
- has_one :phone, dependent: :destroy
- has_one :profile, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :user-transactions, dependent: :destroy

## phoneテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|optional: true|
|phone_number|string|null: false|

### Association
- belongs_to : user

## profileテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|optional: true|
|profile|text|null: true|
|icon|text||

### Association
- belongs_to : user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|optional: true|
|postal_code(郵便番号)|integer|null: false|
|prefectures(都道府県)|string|null: false|
|municipalities(市区町村)|string|null: false|
|house_number(番地)|string|null: false|
|building_name(建物名)|string|null: true|
|house_phone_number(家の電話番号)|integer|null: false|

### Association
- has_many :transactions, dependent: :destroy
- belong_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|optional: true|
|card_number|string|null: false, foreign_key: true|
|expiration_date|date|null: false| 
|securitycord|string|null: false| 

### Association
- belongs_to : user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
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
