require 'rails_helper'

RSpec.describe "TweetsReplies", type: :routing do
  describe "POST /tweets/:tweet_id/replies" do
    it "creates a new reply f0r a tweet" do
      expect(post("/tweets/2/replies")).to route_to("replies#create",tweet_id: "2")
    end
  end
end
