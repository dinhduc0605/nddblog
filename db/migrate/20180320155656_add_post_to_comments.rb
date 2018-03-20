class AddPostToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :posts, foreign_key: true
  end
end
