require 'rails_helper'

RSpec.describe "UsersTweets", type: :request do
  describe "GET /users/:id/tweets" do
   
    let(:user) { FactoryBot.create(:user) }
    let(:tweet) {FactoryBot.create(:tweet,user: user)}
    let(:tweet2) {FactoryBot.create(:tweet,user: user)}
    it "returns a paginated list of tweets for a user" do
     user.save!
     tweet.save!
     tweet2.save!
    
      get "/users/#{user.id}/tweets?page=1&per_page=3"
      
        puts response.body
      expect(response).to have_http_status(201)       
      expect(response).to match_response_schema("user_tweet")
    end
  end
end
