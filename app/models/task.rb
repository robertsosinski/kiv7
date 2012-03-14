class Task < ActiveRecord::Base
  belongs_to :user
  
  def mark_done!
    update_attribute(:done, true) unless done
  end
  
  def mark_open!
    update_attribute(:done, false) if done
  end
  
  def toggle!
    update_attribute(:done, !done)
  end
end
