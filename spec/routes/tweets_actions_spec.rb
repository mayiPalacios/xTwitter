require 'rails_helper'


RSpec.describe "TweetsActions", type: :routing do
  describe "POST /tweets/:id/quote" do
    it "routes to tweets#quote" do
      expect(post("/api/tweets/2/quote.json")).to route_to(
        controller: "api/tweets",
        action: "quote",
        id: "2",
        format: "json" 
      )
    end
  end

  describe "POST /tweets/:id/retweet" do
    it "routes to tweets#retweet" do
      expect(post("/api/tweets/2/retweet.json")).to route_to(
        controller: "api/tweets",
        action: "retweet",
        id: "2",
        format: "json" 
      )
    end
  end
end



