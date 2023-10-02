# spec/requests/users_tweets_and_replies_spec.rb
require 'rails_helper'

RSpec.describe "UsersTweetsReplies", type: :request do
  describe "GET /users/:id/tweets_and_replies" do
    let(:user) { FactoryBot.create(:user) }
    let(:tweet) {FactoryBot.create(:tweet,user: user)}
    let(:reply) {FactoryBot.create_list(:reply,5,user: user)}
    
    it "returns a paginated list of tweets and replies for a user" do
      tweet.save!
      reply[1].save!
      get "/users/#{user.id}/tweets_and_replies"
       
      puts response.body
      expect(response).to have_http_status(201)
    
    end
  end
end
