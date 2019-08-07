class RenameDaysToShipColumnToDeliveries < ActiveRecord::Migration[5.2]
  def change
    rename_column :deliveries, :days_to_ship, :days_to_ship_id
    rename_column :deliveries, :delivery_method, :payment_id
    rename_column :deliveries, :shipping_place, :prefecture_id
  end
end
