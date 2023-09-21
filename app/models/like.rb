class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  #validates :tweets_id, presence: true
  #validates :user_id, presence: true
  validate :unique_combination 

  private 

  def unique_combination
        if self.class.exists?(user_id: self.user_id, tweet_id: self.tweet_id)
              
          errors.add(:base, "you have already liked this tweet")
  
        end
 
  end





end
