class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :username, :password, :password_confirmation
  
  has_many :tasks
  
  validates :username, :presence => true, 
                       :uniqueness => true, 
                       :format => { :with => /^[a-z0-9]{3,10}$/ }
  
  validates :password, :presence => true, 
                       :confirmation => true,
                       :format => { :with => /^([\x20-\x7E]){6,}$/ }
  
  
  def self.authenticate(username, password)
    find_by_username!(username).authenticate(password)
  rescue
    false
  end
end
