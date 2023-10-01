require 'rails_helper'

RSpec.describe "UsersTweets", type: :routing do
  describe "GET /users/:id/tweets" do
    it "returns a paginated list of tweets for a user" do
      expect(get("/users/2/tweets")).to route_to("tweets#index",user_id:"2")
    end
  end
end
