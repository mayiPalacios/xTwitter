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
      user = FactoryBot.create(:user) # Crear un usuario
      tweet1 = FactoryBot.create(:tweet, user: user)
      tweet2 = FactoryBot.create(:tweet, user: user)
      other_tweet = FactoryBot.create(:tweet) # Crear un tweet de otro usuario

      tweets_by_user = Tweet.tweet_by_user(user.id)

      expect(tweets_by_user).to include(tweet1, tweet2)
      expect(tweets_by_user).not_to include(other_tweet)
    end

    describe '.count_quotes' do
      it 'counts the number of quotes for a specific user' do
    
        user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        
       
        FactoryBot.create(:tweet, user: user, quote: true, retweet: false)
        FactoryBot.create(:tweet, user: user, quote: true, retweet: false)
        
     
        FactoryBot.create(:tweet, user: other_user, quote: false, retweet: false)
        
       
        count = Tweet.count_quotes(user.id)
        
      
        expect(count).to eq(2)
      end
    end

  end

  describe '.tweets_and_replies_by_user' do
    it 'returns tweets and replies by a specific user' do
     
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      
      tweet1_user1 = FactoryBot.create(:tweet, user: user1)
      tweet2_user1 = FactoryBot.create(:tweet, user: user1)
      tweet_user2 = FactoryBot.create(:tweet, user: user2) # Tweet de otro usuario
      
      reply1_user1 = FactoryBot.create(:reply, user: user1, tweet: tweet_user2)
      reply2_user2 = FactoryBot.create(:reply, user: user2, tweet: tweet1_user1)
      
     
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
  end


end
