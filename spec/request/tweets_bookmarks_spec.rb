require 'rails_helper'

RSpec.describe "TweetsBookmarks", type: :request do
  describe "POST /tweets/:id/bookmarks" do
    it "creates a new bookmark for a tweet" do
      tweet = create(:tweet)
      user = create(:user)

      sign_in user

      post tweet_bookmarks_path(tweet)

      expect(response).to have_http_status(302)
      expect(Bookmark.count).to eq(1) 
    end
  end

  describe "DELETE /tweets/:id/bookmarks" do
    it "destroys an existing bookmark for a tweet" do
      tweet = create(:tweet)
      user = create(:user)
      bookmark = create(:bookmark, user: user, tweet: tweet)

      sign_in user

      delete tweet_bookmark_path(tweet)

      expect(response).to have_http_status(302)
      expect(Bookmark.count).to eq(0)
    end
  end
end
