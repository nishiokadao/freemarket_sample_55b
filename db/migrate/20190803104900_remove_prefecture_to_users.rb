class RemovePrefectureToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :prefecture, :string
    remove_column :users, :address, :string
    remove_column :users, :birth_date, :string
  end
end
