class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :label
      t.string :address
      t.string :username
      t.string :password_digest
      t.integer :warehouse_id

      t.timestamps
    end
  end
end
