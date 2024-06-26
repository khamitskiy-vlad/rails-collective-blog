class AddRouteToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :route, :string, null: false
  end
end
