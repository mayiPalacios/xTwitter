# spec/requests/users_tweets_and_replies_spec.rb
require 'rails_helper'

RSpec.describe "UsersTweetsReplies", type: :request do
  describe "GET /users/:id/tweets_and_replies" do
    it "returns a paginated list of tweets and replies for a user" do
      user = create(:user)
      tweets = create_list(:tweet, 5, user: user)
      replies = create_list(:reply, 5, user: user)

      get tweets_and_replies_user_path(user)

      expect(response.status).to have_http_status(200)
      expect(response).to match_response_schema("tweets_and_replies")
    end
  end
end
