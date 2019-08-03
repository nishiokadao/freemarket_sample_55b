class AddBuyerIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :Buyer_id, :integer
    add_column :products, :seller_id, :integer, null: false
  end
end
