class ChangeDataTypeForDescriptionUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :description, :text
  end
end
