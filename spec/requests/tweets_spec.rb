require 'rails_helper'

RSpec.describe "Tweets", type: :request do
    describe "POST /tweets" do
      let(:user) { FactoryBot.create(:user) }
      let(:tweet) {FactoryBot.create(:tweet)}
      it "creates a new tweet" do
        token = JsonWebToken.encode({sub: user.id})
         post '/api/tweets', params: { user_id: user.id, body: Faker::Lorem.sentence,quote: false,retweet: false}, headers: { "Authorization" => "Bearer #{token}" }
         puts response.body
         expect(response).to have_http_status(201) 
      
         expect(response).to match_response_schema("tweet")
        end

        it_behaves_like "user authentication" do
          let(:action) { -> { post "/api/tweets/#{tweet.id}/quote", params: { user_id: user.id, body: Faker::Lorem.sentence } } }
        end

        it "update a tweet" do
            token = JsonWebToken.encode({sub: user.id})
            
            patch "/api/tweets/#{tweet.id}", params: { tweet: { body: "Nuevo contenido", quote: false, retweet: false } }, headers: { "Authorization" => "Bearer #{token}" }
             puts response.body
      
            expect(response).to have_http_status(200) 
            expect(response).to match_response_schema("quote")
            end
       end
 end
  
  