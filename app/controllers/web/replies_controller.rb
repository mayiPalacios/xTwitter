class Web::RepliesController < ApplicationController
    def create
     
      tweet = Tweet.find(params[:tweet_id])

      reply = tweet.replies.new(
        user_id: params[:user_id],
        body: params[:body]
      )
         
      if reply.save
        redirect_to web_tweet_path(tweet) 
      else
        render json: { errors: reply.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
  
