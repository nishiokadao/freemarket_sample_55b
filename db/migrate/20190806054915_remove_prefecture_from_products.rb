class RemovePrefectureFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :prefecture, :string
    remove_column :products, :postage, :integer
    remove_column :products, :delivery_day, :integer
    remove_column :products, :delivery_method, :integer
  end
end
