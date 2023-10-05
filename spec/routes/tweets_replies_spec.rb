require 'rails_helper'

RSpec.describe "TweetsReplies", type: :routing do
  describe "POST /api/tweets/:tweet_id/replies" do
    it "routes to replies#create" do
      expect(post("/api/tweets/2/replies.json")).to route_to(
        controller: "api/replies",
        action: "create",
        tweet_id: "2",
        format: "json" 
      )
    end
  end
end
