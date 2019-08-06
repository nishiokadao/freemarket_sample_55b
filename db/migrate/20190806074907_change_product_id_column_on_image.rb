class ChangeProductIdColumnOnImage < ActiveRecord::Migration[5.2]
  def change
    change_column_null :images, :product_id, false, 0
  end
end
