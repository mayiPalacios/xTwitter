
require 'rails_helper'

RSpec.describe "TweetsLikes", type: :request do
  describe "POST /tweets/:tweet_id/likes/new" do
    it "creates a new like for a tweet" do
      tweet = create(:tweet)
      post new_tweet_like_path(tweet)

      expect(response.status).to have_http_status(200)
      expect(response).to match_response_schema("like")
    end
  end

  describe "DELETE /tweets/:tweet_id/likes/:id" do
    it "destroys an existing like for a tweet" do
      tweet = create(:tweet)
      like = create(:like,tweet: tweet)

      delete tweet_like_path(tweet, like)

      expect(response.status).to have_http_status(200)
    end
  end
end
