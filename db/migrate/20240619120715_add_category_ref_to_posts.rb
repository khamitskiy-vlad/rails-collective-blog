class AddCategoryRefToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :category, null: false, foreign_key: true
  end
end
