require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it { should belong_to(:user) } 
  it { should validate_length_of(:body).is_at_most(255) }

  describe 'associations' do
  it { should have_many(:likes) } 
  it { should have_many(:bookmarks) } 
  it { should have_many(:tags) } 
  it { should have_many(:replies) } 

  end
  
 # describe "tweet_by_user scope" do
  #   let(:user)  {FactoryBot.create(:user)}
  
   #  it  "returned a tweet for a especific user" do
    # tweet_by_user = FactoryBot.create(:tweet, user_id: user.id)
     #tweets = Tweet.tweet_by_user(user.id)

     #expect(tweets).to include(tweet_by_user)
     

     #end

    
 # end


end
