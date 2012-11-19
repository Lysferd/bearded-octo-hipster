class Server < ActiveRecord::Base
  attr_accessible :address, :label, :password, :username, :warehouse_id
  belongs_to :warehouse
  has_many :cameras

  def element_count
    cameras.size.zero? ? 1 : cameras.size
  end

  def destroy
    cameras.each { |camera| camera.destroy }
    super
  end

end
