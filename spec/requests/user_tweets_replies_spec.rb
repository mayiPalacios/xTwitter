require 'rails_helper'
require_relative '../support/authentication_shared_examples'

RSpec.describe "UsersTweetsReplies", type: :request do
  describe "GET /users/:id/tweets_and_replies" do
    let(:user) { FactoryBot.create(:user) }
    let(:tweet) {FactoryBot.create(:tweet,user: user)}
    let(:reply) {FactoryBot.create_list(:reply,5,user: user,tweet: tweet)}
    
    it_behaves_like "user authentication" do
      let(:action) { -> { post "/api/tweets/#{tweet.id}/quote", params: { user_id: user.id, body: Faker::Lorem.sentence } } }
  end
     let(:user) { FactoryBot.create(:user) }
    it "returns a paginated list of tweets and replies for a user" do
      user.save!
      tweet.save!
      reply[2].save!
      token = JsonWebToken.encode({sub: user.id})
      
      get "/api/users/#{user.id}/tweets_and_replies?page=2&per_page=3", headers: { "Authorization" => "Bearer #{token}" }
      
      puts "kakakka"
      puts response.body
     
      expect(response).to have_http_status(201)
      expect(response).to match_response_schema("tweets_and_replies")
    end
  end
end
