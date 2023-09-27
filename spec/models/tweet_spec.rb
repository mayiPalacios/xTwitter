require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it { should belong_to(:user) } 
  it { should validate_length_of(:body).is_at_most(255) }

  describe 'associations' do
  it { should have_many(:replies) }
  it { should have_many(:likes) } 
  it { should have_many(:bookmarks) } 
  it { should have_many(:tags) } 
  end
  
  describe 'scopes' do
    
    it 'returns tweets by a specific user' do
      user = FactoryBot.create(:user) 
      tweet1 = FactoryBot.create(:tweet, user: user)
      tweet2 = FactoryBot.create(:tweet, user: user)
      other_tweet = FactoryBot.create(:tweet) 

      tweets_by_user = Tweet.tweet_by_user(user.id)

      expect(tweets_by_user).to include(tweet1, tweet2)
      expect(tweets_by_user).not_to include(other_tweet)
    end

    
      it 'counts the number of quotes for a specific user' do
    
        user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        
       
        FactoryBot.create(:tweet, user_id: user.id, quote: true, retweet: false)
        FactoryBot.create(:tweet, user_id: user.id, quote: true, retweet: false)
        
     
        FactoryBot.create(:tweet, user_id: other_user.id, quote: false, retweet: false)
        
       
        count = Tweet.count_quotes(user.id)
        
      
        expect(count).to eq(2)
      end

      it 'count the number of retweet for a specific user' do
         
        user = FactoryBot.create(:user)
        user2 = FactoryBot.create(:user)

        FactoryBot.create(:tweet,user_id: user.id,quote: false, retweet: true,body: nil)
        FactoryBot.create(:tweet,user_id: user.id,quote: false, retweet: true,body: nil)

        FactoryBot.create(:tweet,user_id: user2.id,quote:false, retweet: false)

        count = Tweet.count_retweet(user.id)

        expect(count).to eq(2)

      end
   
    it 'returns tweets and replies by a specific user' do
      
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      
      tweet1_user1 = FactoryBot.create(:tweet, user_id: user1.id)
      tweet2_user1 = FactoryBot.create(:tweet, user_id: user1.id)
      tweet_user2 = FactoryBot.create(:tweet, user: user2) 
      
      reply1_user1 = FactoryBot.create(:reply, user_id: user1.id, tweet_id: tweet_user2.id)
      reply2_user2 = FactoryBot.create(:reply, user_id: user2.id, tweet_id: tweet1_user1.id)
      
      
      tweets_and_replies = Tweet.tweets_and_replies_by_user(user1.id)
      
      
      expect(tweets_and_replies).to include(tweet1_user1, tweet2_user1, tweet_user2)
      expect(tweets_and_replies).not_to include(reply1_user1, reply2_user2)
    end


end

  describe 'validations' do

    it 'validates presence of body in quote' do
      
      tweet1 = FactoryBot.build(:tweet, quote: true, retweet: false, body: 'This is a quote')
      expect(tweet1).to be_valid

      
      tweet2 = FactoryBot.build(:tweet, quote: true, retweet: false, body: nil)
      expect(tweet2).not_to be_valid
      expect(tweet2.errors[:body]).to include("must contain content  quotes")
    end
  
 
  it 'validates presence of body in retweet' do 
   
    tweet = FactoryBot.build(:tweet, quote: false, retweet: true, body: nil)
    expect(tweet).to be_valid

    tweet2 = FactoryBot.build(:tweet, quote: false, retweet: true,body: 'this is a retweet')
    expect(tweet2).not_to be_valid
    expect(tweet2.errors[:body]).to include("must contain nil content f0r retweets")
 
  end

  it 'validates presence of body in tweet' do

    tweet = FactoryBot.build(:tweet,quote: false,retweet: false,body: "this is a tweet")
    expect(tweet).to be_valid

    tweet2 = FactoryBot.build(:tweet,quote: false,retweet: false,body: nil)
    expect(tweet2).not_to be_valid
    expect(tweet2.errors[:body]).to include("must_contain content by tweets")
 
  end
end


describe 'encapsulations' do
  
  it 'encapsulates the like logic accepting a user' do 
      tweet = FactoryBot.create(:tweet)
      tweet.save!

      user1 = FactoryBot.create(:user)
      like = tweet.like(user1.id)

      expect(like).to include("saved it")

  end

  it 'encapsulates the  retweet logic accepting a user a parameter' do
         
    user1 = FactoryBot.create(:user)
    tweet = FactoryBot.build(:tweet)
  
    retweet = tweet.retweet_method(user1.id)
  
    expect(retweet).to include("saved it")

end

it 'encapsulates the quote logic accepting a user an a text body as parameter' do
  user1 = FactoryBot.create(:user)
  tweet = FactoryBot.build(:tweet)
  
  quote = tweet.quote_method(user1.id,"testing")
   
  expect(quote).to include("saved it")
  end

  it 'encapsulates the logic to scan the body text of a tweet and create a new hashtag' do
    tweet = FactoryBot.build(:tweet,quote: false,retweet: false,body: "this is a hashtag ##{Faker::Lorem.word}")

    duplicate_tweet = FactoryBot.build(:tweet,quote: false,retweet: false,body: tweet.body)

    tweet.save!
    hashtag = tweet.create_hashtags_from_body
    expect(hashtag).to include("Saved it")
    
    duplicate_hashtag = duplicate_tweet.create_hashtags_from_body
    expect(duplicate_hashtag).to include("this hashtag has already been created")
    
 
  end

end



end
