require 'rails_helper'
require_relative '../support/authentication_shared_examples'

RSpec.describe "TweetsReplies", type: :request do
  describe "POST /tweets/:tweet_id/replies" do
    let(:tweet) {FactoryBot.create(:tweet)}
    let(:user) { FactoryBot.create(:user) }
    it_behaves_like "user authentication" do
      let(:action) { -> { post "/api/tweets/#{tweet.id}/replies", params: { user_id: user.id, body: "testing"} } }
    end
    let(:tweet) {FactoryBot.create(:tweet)}
    let(:user) { FactoryBot.create(:user) }

    it "creates a new reply f0r a tweet" do

      token = JsonWebToken.encode({sub: user.id})
      
      post "/api/tweets/#{tweet.id}/replies", params: { user_id: user.id, body: "testing"}, headers: { "Authorization" => "Bearer #{token}" }
        
      expect(response).to have_http_status(201)
      #expect(response).to match_response_schema("reply")
    end
  end
end
