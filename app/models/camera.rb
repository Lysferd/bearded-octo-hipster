class Camera < ActiveRecord::Base
  attr_accessible :label, :camera_id, :server_id
  belongs_to :server
end
