class Warehouse < ActiveRecord::Base
  attr_accessible :label
  has_many :servers
end
