class RenameStausColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :staus, :status
  end
  
end
