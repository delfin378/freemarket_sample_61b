class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :user, optional: true
      t.string :card_number, null: false, foreign_key: true
      t.date :expiration_date, null: false
      t.string :securitycord, null: false

      t.timestamps
    end
  end
end
