class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :label
      t.string :username
      t.string :password_digest
      t.string :address

      t.timestamps
    end
  end
end
