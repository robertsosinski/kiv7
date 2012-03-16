class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :name, :password, :password_confirmation
  
  has_many :tasks
  
  validates :name, :presence => true
  validates :password, :confirmation => true
  
  def self.authenticate(name, password)
    find_by_name!(name).authenticate(password)
  rescue
    false
  end
end
