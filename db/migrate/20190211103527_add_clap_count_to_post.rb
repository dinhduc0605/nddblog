class AddClapCountToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :clap_count, :integer, default: 0
  end
end
