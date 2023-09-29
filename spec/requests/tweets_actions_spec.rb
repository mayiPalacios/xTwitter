require 'rails_helper'

RSpec.describe "TweetsActions", type: :request do
  describe "POST /tweets/:id/quote" do
    it "creates a new quoted tweet" do
      tweet = create(:tweet)

      post quote_tweet_path(tweet)

      expect(response).to have_http_status(200)
      expect(response).to match_response_schema("tweet")
    end

  end

  describe "POST /tweets/:id/retweet" do
    it "creates a new retweet" do
      tweet = create(:tweet)

      post retweet_tweet_path(tweet)

      expect(response).to have_http_status(200)
      expect(response).to match_response_schema("tweet")
    end

    it "returns a 404 error when the tweet does not exist" do
      non_existent_tweet_id = 12345

      get retweet_tweet_path(non_existent_tweet_id)

      expect(response.status).to have_http_status(404)
    end
  end
end
