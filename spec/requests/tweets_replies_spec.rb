require 'rails_helper'

RSpec.describe "TweetsReplies", type: :request do
  describe "POST /tweets/:tweet_id/replies" do
    let(:tweet) {FactoryBot.create(:tweet)}
    let(:user) { FactoryBot.create(:user) }
    it "creates a new reply for a tweet" do
      tweet = create(:tweet)

      post "/tweets/#{tweet.id}/replies", params: { user_id: user.id, body: "testing"}
      
      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("reply")
    end
  end
end
