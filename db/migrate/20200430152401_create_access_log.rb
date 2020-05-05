class CreateAccessLog < ActiveRecord::Migration[6.0]
  def change
    create_table :log_events do |t|
      t.string :url
      t.string :ip_address

      t.timestamps
    end
  end
end
