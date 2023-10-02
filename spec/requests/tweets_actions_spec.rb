require 'rails_helper'

RSpec.describe "TweetsActions", type: :request do
  describe "POST /tweets/:id/quote" do
    let(:tweet) {FactoryBot.create(:tweet)}
    let(:user) { FactoryBot.create(:user) }
    it "creates a new quoted tweet" do
      tweet.save!
      user.save!
 
     post "/tweets/#{tweet.id}/quote", params: { user_id: user.id, body: Faker::Lorem.sentence}
        
      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("tweet")
    end

  end

  describe "POST /tweets/:id/retweet" do
    let(:tweet) {FactoryBot.create(:tweet)}
    let(:user) { FactoryBot.create(:user) }

    it "creates a new retweet" do
      
     post "/tweets/#{tweet.id}/retweet", params: { user_id: user.id}
     puts response.body

      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("tweet")
    end

    # it "returns a 404 error when the tweet does not exist" do
     # non_existent_tweet_id = 12345

     # get "/tweets/#{non_existent_tweet_id}"

     # expect(response).to have_http_status(404)
  #  end
  end
end
