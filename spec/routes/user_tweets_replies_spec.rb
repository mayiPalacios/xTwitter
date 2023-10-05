require 'rails_helper'

RSpec.describe "UsersTweetsReplies", type: :routing do
  describe "GET /api/users/:id/tweets_and_replies" do
    it "routes to users#tweets_and_replies" do
      expect(get("/api/users/2/tweets_and_replies.json")).to route_to(
        controller: "api/users",
        action: "tweets_and_replies",
        id: "2",
        format: "json" 
      )
    end
  end
end
