require 'rails_helper'

RSpec.describe "Tweets", type: :request do
    describe "POST /tweets" do
      let(:user) { FactoryBot.create(:user) }
      let(:tweet) {FactoryBot.create(:tweet)}
    it "creates a new tweet" do
      post '/tweets', params: { user_id: user.id, body: Faker::Lorem.sentence,quote: false,retweet: false}
      expect(response).to have_http_status(201) 
      response.body
      expect(response).to match_response_schema("tweet")
      end

        it "update a tweet" do
          puts "probando"
            puts tweet.id
            patch tweet_path(tweet), params: { tweet: { body: "Nuevo contenido", quote: false, retweet: false } }
             puts response.status
            expect(response).to have_http_status(200) 
            expect(response).to match_response_schema("tweet")
            end
       end
 end
  
  