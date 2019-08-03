class RenameBuyerIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :Buyer_id, :buyer_id
  end
end
