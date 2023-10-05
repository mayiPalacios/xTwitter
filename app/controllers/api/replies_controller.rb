class Api::RepliesController < ApiController
  
    def create
        tweet = Tweet.find(params[:tweet_id])
  
        @reply = tweet.replies.new(
          user_id: params[:user_id],
          body: params[:body]
        )
         #@reply.save!
         
        if @reply.save!
          render  status: :created
        else
          render json: { errors: reply.errors.full_messages }, status: :unprocessable_entity
        end
      end

end