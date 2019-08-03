class AddimageIdToProducts < ActiveRecord::Migration[5.2]
  def change

    add_column :products, :seller_id, null: false
    add_column :products, :buyer_id
  end
end
