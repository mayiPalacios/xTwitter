json.tweets_and_replies? do
    json.tweets @tweets_and_replies[:tweets] do |tweet|
      json.id tweet.id
      json.body tweet.body
      json.quote tweet.quote
      json.retweet tweet.retweet
      json.created_at tweet.created_at
      json.updated_at tweet.updated_at
      json.user_id tweet.user_id
      json.interaction_reference tweet.interaction_reference
    end
  
    json.replies @tweets_and_replies[:replies] do |reply|
      json.id reply.id
      json.body reply.body
      json.created_at reply.created_at
      json.updated_at reply.updated_at
      json.user_id reply.user_id
      json.tweet_id reply.tweet_id
    end
  end
  
  json.pagination do
    json.page params[:page]
    json.per_page params[:per_page]
  end