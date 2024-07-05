class ChangeRouteColumnNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :categories, :route, true 
  end
end
