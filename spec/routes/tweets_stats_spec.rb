require 'rails_helper'

RSpec.describe "TweetsStats", type: :request do
  describe "GET /tweets/:id/stats" do
    it "returns the statistics for a tweet" do
      expect(get("/tweets/2/stats")).to route_to("tweets#stats",id:"2")
    end
  end
end
