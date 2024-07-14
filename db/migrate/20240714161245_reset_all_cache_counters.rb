class ResetAllCacheCounters < ActiveRecord::Migration[7.1]
  def up
    Post.find_each do |post|
      Post.reset_counters(post.id, :comments)
      Post.reset_counters(post.id, :likes)
    end

    User.find_each do |user|
      User.reset_counters(user.id, :comments)
      User.reset_counters(user.id, :likes)
    end
  end
end
