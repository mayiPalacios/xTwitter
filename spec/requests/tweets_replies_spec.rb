require 'rails_helper'

RSpec.describe "TweetsReplies", type: :request do
  describe "POST /tweets/:tweet_id/replies" do
    it "creates a new reply for a tweet" do
      tweet = create(:tweet)

      post tweet_replies_path(tweet), params: { reply: { body: "A reply to the tweet" } }

      expect(response.status).to have_http_status(200)
      expect(response).to match_response_schema("reply")
    end
  end
end
