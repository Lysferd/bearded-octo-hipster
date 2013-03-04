class Server < ActiveRecord::Base
  attr_accessible :address, :admin_port, :media_port, :label, :password, :username, :warehouse_id
  belongs_to :warehouse
  has_many :cameras
  has_many :exclusive_cameras

  def shortname
    self.label[self.label.index("\s").to_i + (self.label =~ /\s/ ? 1 : 0)..-1].downcase
  end

  def element_count
    cameras.size.zero? ? 1 : cameras.size
  end

  def destroy
    cameras.each { |camera| camera.destroy }
    super
  end

end
