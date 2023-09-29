RSpec.describe "Tweets", type: :request do
    describe "POST /tweets" do
      let(:tweet_params) {
        {
          user_id: 3,
          body: 'test create tweet'
        }
      }
      it "create a new tweet" do
       
        post tweets_path(tweet_params)
  
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
  
  