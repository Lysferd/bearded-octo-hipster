class CreateExclusiveCameras < ActiveRecord::Migration
  def change
    create_table :exclusive_cameras do |t|
      t.string :label
      t.string :server_id
      t.string :camera_id

      t.timestamps
    end
  end
end
