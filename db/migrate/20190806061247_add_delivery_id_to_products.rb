class AddDeliveryIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :delivery, foreign_key: true
  end
end
