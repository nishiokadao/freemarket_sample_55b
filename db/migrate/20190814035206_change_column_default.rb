class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :likes_count, 0
  end
end
