#/web/tweets/feed

# spec/controllers/tweets_controller_spec.rb

require 'rails_helper'

RSpec.describe "FeedTweet", type: :request do
  describe 'GET #feed' do
    let(:user) { FactoryBot.create(:user) }
    let(:user2) { FactoryBot.create(:user) }
    let(:user3) { FactoryBot.create(:user) }
    let(:tweet) { FactoryBot.create(:tweet,user_id: user.id) }
    let(:tweet2) { FactoryBot.create(:tweet,user_id: user2.id) }
    let(:tweet3) { FactoryBot.create(:tweet,user_id: user3.id) }
    let(:follower) { FactoryBot.build(:follower, following: user, followee: user2) }
    it 'returns a success response' do
      user.save!
      user2.save!
      user3.save! 
      tweet.save! 
      tweet2.save!
      tweet3.save!   
      follower.save! 
      
      token = JsonWebToken.encode({sub: user.id})
      
      get "/web/tweets", params: { user_id: user.id }, headers: { "Authorization" => "Bearer #{token}" }
      
      puts response.body
      expect(response).to have_http_status(200)
    end
  end
end
