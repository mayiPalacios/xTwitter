class Follower < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :followee, class_name: "User"
  validate :unique_combination 

  private 

  def unique_combination
        if self.class.exists?(following: self.following, followee: self.followee)
              
          errors.add(:base, "you have already followed this person")
  
        end

      end
end
