class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :username, :password, :password_confirmation
  
  has_many :tasks
  
  validates :username, :presence => true, 
                       :uniqueness => true, 
                       :format => { :with => /^[a-z0-9]{3,10}$/, :message => "must be 3 to 10 lower-case letters or numbers" }
  
  validates :password, :presence => true, 
                       :confirmation => true,
                       :format => { :with => /^([\x20-\x7E]){6,}$/, :message => "must be 3 or more characters" }
  
  
  def self.authenticate(username, password)
    find_by_username!(username).authenticate(password)
  rescue
    false
  end
end
