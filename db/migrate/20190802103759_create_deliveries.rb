class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :days_to_ship, null: false
      t.string :mode, null: false
      t.integer :delivery_method, null: false
      t.string :shipping_place, null: false
      t.timestamps
    end
  end
end
