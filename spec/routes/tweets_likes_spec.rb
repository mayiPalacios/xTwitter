
require 'rails_helper'

RSpec.describe "TweetsLikes", type: :routing do
  describe "POST /tweets/:tweet_id/likes/new" do
    it "creates a new like f0r a tweet" do
      expect(post("/tweets/2/likes")).to route_to("likes#create",tweet_id: "2")
    end
  end

  describe "DELETE /tweets/:tweet_id/likes/:id" do
    it "destroys an existing like for a tweet" do
      expect(delete("/tweets/2/likes/1")).to route_to("likes#destroy",tweet_id: "2",id:"1")
    end
  end
end
