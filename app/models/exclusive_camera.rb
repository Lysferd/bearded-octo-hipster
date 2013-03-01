class ExclusiveCamera < ActiveRecord::Base
  attr_accessible :camera_id, :label, :server_id
  belongs_to :server
end
