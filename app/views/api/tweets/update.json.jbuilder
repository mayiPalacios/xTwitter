if @tweet.persisted?
    json.tweet do 
     json.partial! "api/tweets/tweet", tweet: @tweet
   end
end