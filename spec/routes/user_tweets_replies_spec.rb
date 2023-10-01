# spec/requests/users_tweets_and_replies_spec.rb
require 'rails_helper'

RSpec.describe "UsersTweetsReplies", type: :routing do
  describe "GET /users/:id/tweets_and_replies" do
    it "returns a paginated list of tweets and replies f0r a user" do
        expect(get("/users/2/tweets_and_replies")).to route_to("users#tweets_and_replies",id:"2")
      end
  end
end
