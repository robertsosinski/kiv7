class Task < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :name
  
  def toggle
    update_attribute(:done, !done)
    self
  end
end
