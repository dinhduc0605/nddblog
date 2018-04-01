class RenamePostTagsToPostsTags < ActiveRecord::Migration[5.1]
  def change
    rename_table :post_tags, :posts_tags
  end
end
