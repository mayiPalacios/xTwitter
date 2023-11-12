require 'rails_helper'

RSpec.describe "TweetsBookmarks", type: :routing do
  describe "POST /tweets/:tweet_id/bookmarks" do
    it "routes to bookmarks#create" do
      expect(post("/api/tweets/2/bookmarks.json")).to route_to(
        controller: "api/bookmarks",
        action: "create",
        tweet_id: "2",
        format: "json"
      )
    end
  end

  describe "DELETE /tweets/:tweet_id/bookmarks/:id" do
    it "routes to bookmarks#destroy" do
      expect(delete("/api/tweets/2/bookmarks/1.json")).to route_to(
        controller: "api/bookmarks", 
        action: "destroy",
        tweet_id: "2",
        id: "1",
        format: "json"
      )
    end
  end
end
