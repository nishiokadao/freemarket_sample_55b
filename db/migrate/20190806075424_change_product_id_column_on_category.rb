class ChangeProductIdColumnOnCategory < ActiveRecord::Migration[5.2]
  def change
    change_column_null :categories, :product_id, false, 0
    change_column_null :categories, :name_id, false, 0
  end
end
