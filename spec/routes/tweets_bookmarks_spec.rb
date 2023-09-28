require 'rails_helper'

RSpec.describe "TweetsBookmarks", type: :routing do
  describe "POST /tweets/:id/bookmarks" do
    it "creates a new bookmark for a tweet" do
      expect(post("/tweets/2/bookmarks")).to route_to("bookmarks#create",tweet_id:"2")
    end
  end

  describe "DELETE /tweets/:id/bookmarks" do
    it "destroys an existing bookmark f0r a tweet" do
      expect(post("/tweets/2/bookmarks/1")).to route_to("bookmarks#destroy",tweet_id:"2",id:"1")
    end
  end
end
