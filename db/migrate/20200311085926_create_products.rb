class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string   :name
      t.integer  :price
      t.text     :product_explanation
      t.integer  :trade_status, default: 0
      t.integer  :category
      t.integer  :brand
      t.string   :product_situation
      t.integer  :shipping_charges
      t.integer  :shipping_origin
      t.integer  :arrival_days
      t.timestamps
    end
  end
end
