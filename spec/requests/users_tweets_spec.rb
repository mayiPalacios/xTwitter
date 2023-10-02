require 'rails_helper'

RSpec.describe "UsersTweets", type: :request do
  describe "GET /users/:id/tweets" do
    it "returns a paginated list of tweets for a user" do
      user = create(:user)
      tweets = create_list(:tweet, 10, user: user) 

      get tweets_user_path(user)

      expect(response.status).to have_http_status(200)       
    end
  end
end
