class CreateExclusiveCameras < ActiveRecord::Migration
  def change
    create_table :exclusive_cameras do |t|
      t.string :label
      t.integer :server_id
      t.integer :camera_id

      t.timestamps
    end
  end
end
