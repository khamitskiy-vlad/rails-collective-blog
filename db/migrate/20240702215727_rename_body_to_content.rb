class RenameBodyToContent < ActiveRecord::Migration[7.1]
  def change
    rename_column :post_comments, :body, :content
  end
end
