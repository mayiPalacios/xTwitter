class Hashtag < ApplicationRecord
    has_many :tags 

 ##
    def hashtag(hashtag_name)
      
      tweet = Tweet.new(body:"example 1",quote: false,retweet: false,user_id: user_id);
      tweet.save!
      
        if self.hashtags.exists?(hashtag_name: hashtag_name)
              
            return "you have already create this hashtag name"
      
          end

          hash = hashtags.new(hashtag_name: hashtag_name)
         hash.save!
           

          taag = tags.new(hashtag_id: hash.id,tweet_id: tweet.id)
        if taag.save!
         return "saved it"
        end

        end
end
