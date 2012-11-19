class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  validates :username, presence: true, uniqueness: true
  after_destroy :ensure_an_admin_remains
  has_secure_password

  def ensure_an_admin_remains
    fail('Last user on the application - Impossible to destroy.') if User::count.zero?
  end

end
