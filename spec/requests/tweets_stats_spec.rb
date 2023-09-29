require 'rails_helper'

RSpec.describe "TweetsStats", type: :request do
  describe "GET /tweets/:id/stats" do
    it "returns the stats for an existent tweet" do
     
      tweet = create(:tweet) 
      get tweet_stats_path(tweet)

      expect(response.status).to have_http_status(200)
      expect(response).to match_response_schema("stats")
    end

    it "returns a 404 error when the tweet does not exist" do
      non_existent_tweet_id = 123459999

      get tweet_stats_path(non_existent_tweet_id)

      expect(response.status).to have_http_status(404)
    end
  end
end
