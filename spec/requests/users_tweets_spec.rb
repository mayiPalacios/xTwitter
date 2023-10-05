require 'rails_helper'
require_relative '../support/authentication_shared_examples'

RSpec.describe "UsersTweets", type: :request do
  describe "GET /users/:id/tweets" do
   
     let(:user) { FactoryBot.create(:user) }
     let(:tweet) {FactoryBot.create(:tweet,user: user)}
     let(:tweet2) {FactoryBot.create(:tweet,user: user)}

     it_behaves_like "user authentication" do
         let(:action) { -> { post "/api/tweets/#{tweet.id}/quote", params: { user_id: user.id, body: Faker::Lorem.sentence } } }
     end

      it "returns a paginated list of tweets for a user" do
       user.save!
       tweet.save!
       tweet2.save!
       token = JsonWebToken.encode({sub: user.id})
       get "/api/users/#{user.id}/tweets?page=1&per_page=3", headers: { "Authorization" => "Bearer #{token}" }
      
           puts response.body
           expect(response).to have_http_status(200)       
           expect(response).to match_response_schema("user_tweet")
       end
    end
end
