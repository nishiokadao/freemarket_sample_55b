class AddUserIdToCredits < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :payjp_id, :integer, null: false
    add_column :credits, :card_id, :integer, null:false
    add_reference :credits, :user, foreign_key: true
  end
end
