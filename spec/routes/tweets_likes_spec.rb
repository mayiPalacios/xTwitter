
require 'rails_helper'

RSpec.describe "TweetsLikes", type: :routing do
  describe "POST /api/tweets/:tweet_id/likes" do
    it "routes to likes#create" do
      expect(post("/api/tweets/2/likes.json")).to route_to(
        controller: "api/likes",
        action: "create",
        tweet_id: "2",
        format: "json" 
      )
    end
  end

  describe "DELETE /api/tweets/:tweet_id/likes/:id" do
    it "routes to likes#destroy" do
      expect(delete("/api/tweets/2/likes/1.json")).to route_to(
        controller: "api/likes",
        action: "destroy",
        tweet_id: "2",
        id: "1",
        format: "json" 
      )
    end
  end
end
