class AddLikesCountToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :likes_count, :integer
  end
end
