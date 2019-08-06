class AddProductionIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :product, foreign_key: true
    add_column :categories, :name_id, :integer
  end
end
