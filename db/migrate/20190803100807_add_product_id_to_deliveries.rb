class AddProductIdToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_reference :deliveries, :product, foreign_key: true
  end
end
