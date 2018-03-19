class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :email
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
