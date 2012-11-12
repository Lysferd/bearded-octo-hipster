class Server < ActiveRecord::Base
  attr_accessible :address, :label, :password_digest, :username, :warehouse_id
end
