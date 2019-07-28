class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null:false
      t.string :staus, null:false
      t.string :prefecture, null:false
      t.text :description, null:false
      t.integer :price,null:false
      t.integer :condition,null:false
      t.integer :delivery_method,null:false
      t.integer :delivery_day,null:false
      t.integer :postage,null:false
      t.integer :image_id,null:false
      t.timestamps
    end
  end
end
