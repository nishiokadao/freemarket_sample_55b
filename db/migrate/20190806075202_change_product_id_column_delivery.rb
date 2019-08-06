class ChangeProductIdColumnDelivery < ActiveRecord::Migration[5.2]
  def change
    change_column_null :deliveries, :product_id, false, 0
  end
end
