class ChangeCategoryToCategoryIdInPost < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :category, :category_id
  end
end
