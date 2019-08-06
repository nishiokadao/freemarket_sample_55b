class RenameConditionColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :condition, :condition_id
  end
end
