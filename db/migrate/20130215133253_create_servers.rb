class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :label
      t.string :address
      t.string :username
      t.string :password
      t.integer :warehouse_id
      t.integer :admin_port
      t.integer :media_port

      t.timestamps
    end
  end
end
