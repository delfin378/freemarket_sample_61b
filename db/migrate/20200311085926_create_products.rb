class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string   :name,               limit:40,null:false,index: true
      t.integer  :price,              index: true
      t.text     :product_explanation,null:false
      t.integer  :trade_status, default: 0
      t.integer  :category           
      t.string  :brand
      t.string   :product_situation  
      t.integer  :shipping_charges   
      t.integer  :shipping_origin    
      t.integer  :arrival_days       
      t.timestamps
    end
  end
end
