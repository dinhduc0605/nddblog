class AddViewCountToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :view_count, :integer, default: 0
  end
end
