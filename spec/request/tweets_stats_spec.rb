require 'rails_helper'

RSpec.describe "TweetsStats", type: :request do
  describe "GET /tweets/:id/stats" do
    it "returns the statistics for a tweet" do
      tweet = create(:tweet)
      create_list(:quote, 3, tweet: tweet)
      create_list(:retweet, 4, tweet: tweet)
      create_list(:reply, 2, tweet: tweet)
      create_list(:bookmark, 5, tweet: tweet)
      create_list(:like, 6, tweet: tweet)

      get tweet_stats_path(tweet)

      expect(response).to have_http_status(200)
      expect(response).to render_template(:tweet_stats)

      expect(response.body).to include("Quotes: 3")
      expect(response.body).to include("Retweets: 4")
      expect(response.body).to include("Replies: 2")
      expect(response.body).to include("Bookmarks: 5")
      expect(response.body).to include("Likes: 6")
    end
  end
end
