require 'rails_helper'
require_relative '../support/authentication_shared_examples'



RSpec.describe "TweetsActions", type: :request do
  

  describe "POST /api/tweets/:id/quote" do
    let(:tweet) { FactoryBot.create(:tweet) }
    let(:user) { FactoryBot.create(:user) }
   
    it_behaves_like "user authentication" do
      let(:action) { -> { post "/api/tweets/#{tweet.id}/quote", params: { user_id: user.id, body: Faker::Lorem.sentence } } }
    end
  
         it "creates a new quoted tweet" do

             token = JsonWebToken.encode({sub: user.id})
             post "/api/tweets/#{tweet.id}/quote", params: { user_id: user.id, body: Faker::Lorem.sentence }, headers: { "Authorization" => "Bearer #{token}" }
             
             puts response.body
             expect(response).to have_http_status(201)
             expect(response).to match_response_schema("quote")
         end
  end
  
  

  describe "POST /api/tweets/:id/retweet" do
    let(:tweet) {FactoryBot.create(:tweet)}
    let(:user) { FactoryBot.create(:user) }
 
    it_behaves_like "user authentication" do
      let(:action) { -> { post "/api/tweets/#{tweet.id}/quote", params: { user_id: user.id, body: Faker::Lorem.sentence } } }
    end

    it "creates a new retweet" do
      token = JsonWebToken.encode({sub: user.id})
     post "/api/tweets/#{tweet.id}/retweet", params: { user_id: user.id}, headers: { "Authorization" => "Bearer #{token}" }
     puts response.body

      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("retweet")
    end

  end

end
