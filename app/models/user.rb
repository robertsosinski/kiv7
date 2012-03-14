class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :name, :password, :password_confirmation
  
  has_many :tasks
  
  validates :name, :presence => true
  validates :password, :confirmation => true
end
