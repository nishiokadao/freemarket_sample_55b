class RemoveImageIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :products, column: :image_id
    remove_foreign_key :products, column: :delivery_id
  end
end
