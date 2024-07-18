class AddIndexToCategories < ActiveRecord::Migration[7.1]
  def change
    add_index :categories, [:name, :route], unique: true
  end
end
