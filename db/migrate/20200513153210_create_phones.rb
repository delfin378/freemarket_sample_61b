class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.references :user, optional: true
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
