class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :tweets
  has_many :bookmarks
  has_many :replies
  validates :body, length: { maximum: 255 }
  validate :body_presence_in_quote
  validate :body_nil_for_retweet
  validate :body_presence_in_tweet

 private 

 def body_presence_in_quote
   if self.quote? && !self.retweet? && self.body.nil?
    self.errors.add(:body, "must contain content  quotes") 
  end
end

def body_presence_in_tweet
  if !self.quote? && !self.retweet? && self.body.nil?
    self.errors.add(:body, "must_contain content by tweets") 
  end
end


def body_nil_for_retweet
  if !self.quote? && self.retweet? && !self.body.nil?
     errors.add(:body, "must contain nil content f0r retweets")
  end
end

end