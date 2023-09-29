require 'rails_helper'

RSpec.describe "TweetsActions", type: :request do
  describe "POST /tweets/:id/quote" do
    it "creates a new quoted tweet" do
      tweet = create(:tweet)

     post quote_tweet_path(tweet)

      probando = '{
        "tweet": {
          "body": "Este es el cuerpo del tweet",
          "quote": false,
          "retweet": true,
          "created_at": "2023-09-28T12:00:00Z",
          "updated_at": "2023-09-28T12:30:00Z",
          "user_id": 1
        }
      }'

      expect(response.status).to have_http_status(200)
      expect(response).to match_response_schema("tweet")
    end

  end

  describe "POST /tweets/:id/retweet" do
    it "creates a new retweet" do
      tweet = create(:tweet)

      post retweet_tweet_path(tweet)

      expect(response.status).to have_http_status(200)
      expect(response).to match_response_schema("tweet")
    end

    it "returns a 404 error when the tweet does not exist" do
      non_existent_tweet_id = 12345

      get retweet_tweet_path(non_existent_tweet_id)

      expect(response.status).to have_http_status(404)
    end
  end
end
