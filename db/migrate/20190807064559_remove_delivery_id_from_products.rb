class RemoveDeliveryIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :image_id, :integer
    remove_column :products, :delivery_id, :integer
  end
end
