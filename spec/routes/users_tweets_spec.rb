require 'rails_helper'

RSpec.describe "UsersTweets", type: :routing do
  describe "GET /api/users/:user_id/tweets" do
    it "routes to api/tweets#index" do
      expect(get("/api/users/2/tweets")).to route_to(
        format: :json,
        controller: "api/tweets",
        action: "index",
        user_id: "2"
      )
    end
  end
end
