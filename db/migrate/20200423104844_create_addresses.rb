class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user_id, null: false
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :postal_code, null: false
      t.string :prefectures, null: false
      t.string :municipalities, null: false
      t.string :house_number, null: false
      t.string :building_name, null: false
      t.string :house_phone_number, null: false

      t.timestamps
    end
  end
end
