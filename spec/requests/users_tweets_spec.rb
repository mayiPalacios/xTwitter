require 'rails_helper'

RSpec.describe "UsersTweets", type: :request do
  describe "GET /users/:id/tweets" do
    let(:tweet) {FactoryBot.create(:tweet)}
    let(:user) { FactoryBot.create(:user) }
    it "returns a paginated list of tweets for a user" do
     user.save!
     tweet.save!
    
      get "/users/#{user.id}/tweets"
      
        
      expect(response).to have_http_status(200)       
    end
  end
end
