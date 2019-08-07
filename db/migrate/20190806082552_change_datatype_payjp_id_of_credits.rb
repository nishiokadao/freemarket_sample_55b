class ChangeDatatypePayjpIdOfCredits < ActiveRecord::Migration[5.2]
  def change
    change_column :credits, :payjp_id, :string
    change_column :credits, :card_id, :string
  end
end
