class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.integer :user_id, optional: true
      t.integer :card_number, null: false, foreign_key: true
      t.date :expiration_date, null: false
      t.integer :securitycord, null: false

      t.timestamps
    end
  end
end
