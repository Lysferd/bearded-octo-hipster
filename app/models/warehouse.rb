class Warehouse < ActiveRecord::Base
  attr_accessible :label
  has_many :servers

  def element_count
    return -1 if servers.empty?

    number = 0
    servers.each do |server|
      number += server.element_count
    end
    number
  end

  def destroy
    servers.each { |server| server.destroy }
    super
  end

end
