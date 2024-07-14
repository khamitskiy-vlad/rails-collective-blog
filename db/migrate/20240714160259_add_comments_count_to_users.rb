class AddCommentsCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :comments_count, :integer
  end
end
