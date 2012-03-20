class Task < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :name
  
  validates :name, :presence => true,
                   :uniqueness => { :scope => :user_id }
  
  def toggle
    update_attribute(:done, !done)
    self
  end
end
