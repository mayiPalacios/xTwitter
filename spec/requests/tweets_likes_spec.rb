
require 'rails_helper'
require_relative '../support/authentication_shared_examples'

RSpec.describe "TweetsLikes", type: :request do
  describe "POST /tweets/:tweet_id/likes/new" do
    let(:tweet) {FactoryBot.create(:tweet)}
    let(:user) { FactoryBot.create(:user) }

    it "creates a new like for a tweet" do
      tweet = create(:tweet)
      
      post "/api/tweets/#{tweet.id}/likes", params: { user_id: user.id }
      puts response.body
      
      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("like")
    end
  end

  describe "DELETE /tweets/:tweet_id/likes/:id" do
    let(:tweet) {FactoryBot.create(:tweet)}
    let(:user) { FactoryBot.create(:user) }
    let(:like) {FactoryBot.create(:like,user: user, tweet: tweet)}
    it "destroys an existing like for a tweet" do
   
      delete "/api/tweets/#{tweet.id}/likes/#{like.id}"
    

      expect(response).to have_http_status(200)
    end
  end
end
