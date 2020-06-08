class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string   :name,               limit:40,index: true,null:false
      t.integer  :price,              index: true,null:false
      t.text     :product_explanation,null:false
      t.integer  :trade_status, default: 0
      t.integer  :category           , null: false
      t.text     :brand              , null: false
      t.string   :product_situation  , null: false
      t.integer  :shipping_charges   , null: false
      t.integer  :shipping_origin    , null: false
      t.integer  :arrival_days       , null: false
      t.references :user         , optional: true
      t.integer  :purchaser_id
      t.timestamps
    end
  end
end
