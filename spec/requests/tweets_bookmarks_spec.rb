require 'rails_helper'

RSpec.describe "TweetsBookmarks", type: :request do
  describe "POST /tweets/:id/bookmarks" do
    it "creates a new bookmark for a tweet" do
      tweet = create(:tweet)

      post tweet_bookmarks_path(tweet)

      expect(response.status).to have_http_status(200)
      expect(response).to match_response_schema("bookmark")
    end
  end

  describe "DELETE /tweets/:id/bookmarks" do
    it "destroys an existing bookmark for a tweet" do
      tweet = create(:tweet)
      user = create(:user)
      bookmark = create(:bookmark, user: user, tweet: tweet)

      delete tweet_bookmark_path(:bookmark,tweet)

      expect(response.status).to have_http_status(200)
    end
  end
end
