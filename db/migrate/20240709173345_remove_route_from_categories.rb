class RemoveRouteFromCategories < ActiveRecord::Migration[7.1]
  def change
    remove_column :categories, :route, :string
  end
end
