class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :label
      t.integer :camera_id
      t.integer :server_id

      t.timestamps
    end
  end
end
