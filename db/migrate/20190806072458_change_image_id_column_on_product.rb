class ChangeImageIdColumnOnProduct < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :image_id, false, 0
    change_column_null :products, :delivery_id, false, 0
  end
end
