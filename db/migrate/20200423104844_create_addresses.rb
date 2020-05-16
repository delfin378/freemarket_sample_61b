class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, optional: true
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
