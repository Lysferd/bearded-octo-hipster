class Server < ActiveRecord::Base
  attr_accessible :address, :label, :password, :username, :warehouse_id
  belongs_to :warehouse
  has_many :cameras
end
