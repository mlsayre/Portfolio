class ChangeAuthorInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :author, :creator
  end
end
