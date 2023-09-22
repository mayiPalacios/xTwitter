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
  scope :create_sample_tweets, -> {
    create([
      { body: "Ejemplo 1", quote: true, retweet: false, user_id: 1},
      { body: "Ejemplo 2", quote: false, retweet: true, user_id: 2},
      { body: "Ejemplo 3", quote: true, retweet: true, user_id: 3 },
      { body: "Ejemplo 4", quote: false, retweet: false, user_id: 4},
      { body: "Ejemplo 5", quote: true, retweet: false, user_id: 5 },
      { body: "Ejemplo 6", quote: false, retweet: true, user_id: 1 },
      { body: "Ejemplo 7", quote: true, retweet: true, user_id: 2},
      { body: "Ejemplo 8", quote: false, retweet: false, user_id: 3 },
      { body: "Ejemplo 9", quote: true, retweet: false, user_id: 4 },
      { body: "Ejemplo 10", quote: false, retweet: true, user_id: 5 }
    ])
  }
  
  
  scope :tweets_and_replies_by_user, ->(user_id){
    where(user_id: user_id).or(where(id: Replie.where(user_id: user_id).select(:tweet_id)))
  }

  scope :count_quotes, -> (user_id){
    where(user_id: user_id, retweet: false, quote: true).count
  }

  scope :count_retweet, -> (user_id){
    where(user_id: user_id, retweet: true, quote: false).count
  }

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