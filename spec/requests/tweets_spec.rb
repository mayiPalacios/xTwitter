RSpec.describe "Tweets", type: :request do
    describe "POST /tweets" do
      it "create a new tweet" do
       
        post tweets_path()
  
        expect(response.status).to have_http_status(200) 
        expect(response).to match_response_schema("tweet")
        end

        it "update a tweet" do
           tweet_id = 2
            patch  tweets_path(tweet_id)
      
            expect(response.status).to have_http_status(200) 
            expect(response).to match_response_schema("tweet")
            end
        end
 end
  
  