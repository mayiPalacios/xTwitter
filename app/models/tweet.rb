class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :bookmarks
  has_many :tags
  has_many :replies, class_name: 'Reply', foreign_key: 'tweet_id', dependent: :destroy
  validates :body, length: { maximum: 255 }
  validate :body_presence_in_quote
  validate :body_nil_for_retweet
  validate :body_presence_in_tweet
  scope :create_sample_tweets, -> {
    create([
      { body: "Ejemplo 1", quote: true, retweet: false, user_id: 1},
      {    quote: false, retweet: true, user_id: 2},
      {   quote: false, retweet: true,  user_id: 3 },
      { body: "Ejemplo 4", quote: false, retweet: false,user_id: 4},
      { body: "Ejemplo 5", quote: true, retweet: false, user_id: 5 },
      {  quote: false, retweet: true, user_id: 1 },
      {   quote: true, retweet: true,  user_id: 2},
      { body: "Ejemplo 8", quote: false, retweet: false,user_id: 3 },
      { body: "Ejemplo 9", quote: true, retweet: false, user_id: 4 },
      {  quote: false, retweet: true,user_id: 5 }
    ])
  }
  
  scope :tweet_by_user, ->(user_id){#
    where(user_id: user_id)
  }
  
  scope :tweets_and_replies_by_user, ->(user_id){ #
    where(user_id: user_id).or(where(id: Reply.where(user_id: user_id).select(:tweet_id)))
  }

  scope :count_quotes, -> (user_id){ #
    where(user_id: user_id, retweet: false, quote: true).count
  }

  scope :count_retweet, -> (user_id){#
    where(user_id: user_id, retweet: true, quote: false).count
  }

# remember put this 
# tweet = Tweet.new()
# give a value to tweet object
# tweet.save!
# tweet.like(user_id)
# Like a tweet: Create a method that encapsulates the like logic accepting a user

  def like(user_id)
    

    if self.likes.exists?(user_id: user_id)
              
      return "you have already liked this tweet"

    end
    like = likes.new(user_id: user.id)

    if like.save!
      return "saved it"
    end
  end

  #Retweet method: Create a method that encapsulates
  #the retweet logic accepting a user a parameter

  def retweet_method(user_id)

  retweet = Tweet.new(quote: false,retweet: true,user_id: user_id);

 if retweet.save!
  return "saved it"
end
  end

#QuoteTweet: Create a method that encapsulates 
#the quote logic accepting a user an a text 
#body as parameter


  def quote_method(user_id,body)

    quote = Tweet.new( body: body,quote: true, retweet: false,user_id: user_id);

    if quote.save!
      return "saved it"
    end
   
    end

    #steps
    #tweet = Tweet.new(body: "this is a example #naruto.",user_id: 2)
    #tweet.create_hashtags_from_body

    def create_hashtags_from_body
      body.scan(/#\w+/).each do |hashtag_text|
        hashtag_name = hashtag_text[1..-1]  
        
        
        hashtag = Hashtag.find_or_initialize_by(hashtag_name: hashtag_name)
        
        unless Hashtag.exists?(hashtag_name: hashtag_name)
          tag = tags.build(hashtag: hashtag)  
          tag.save  
          hashtag.save  
          return "Saved it"  
        end
        return "this hashtag has already been created"
      end
    end

   


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