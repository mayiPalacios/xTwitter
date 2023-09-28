require 'rails_helper'

RSpec.describe "UsersTweets", type: :request do
  describe "GET /users/:id/tweets" do
    it "returns a paginated list of tweets for a user" do
      user = create(:user)
      tweets = create_list(:tweet, 10, user: user) 

      get tweets_user_path(user)

      expect(response).to have_http_status(200) 
      expect(response).to render_template(:tweets) 

      
      tweets.each do |tweet|
        expect(response.body).to include(tweet.body)
      end
    end
  end
end
