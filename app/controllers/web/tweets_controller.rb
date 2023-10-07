class Web::TweetsController < ApplicationController
  include TweetStatsModule
    def create
        user_id = params[:user_id]
        body = params[:body]
        quote = params[:quote]
        retweet = params[:retweet]
   
        @tweet = Tweet.new(user_id: user_id, body: body, quote: quote, retweet: retweet)
   
        
        respond_to do |format|
          if @tweet.save
            format.html { redirect_to '/web/tweets' }
          end
        end
 
    end
 
  #  def index
  #       user_id = params[:user_id]
 
  #       user = User.find(params[:user_id])
  #       @tweets = user.tweets.paginate(page: params[:page], per_page: 2) 

  #       respond_to do |format|
  #         if @tweets
  #         format.html { render '/web/tweets/index' } 
  #        # format.json { render json: { tweet: @tweets }, status: :created }
  #         end
  #      end
    
  #  end


     def index 
        @tweets = Tweet.all()

         respond_to do |format|
         if @tweets
         format.html { render '/web/tweets/index' } 
             
         end
      end
   end 
   
   
   before_action :set_tweet, only: [:update,:retweet]
   
   def update
         if @tweet.update(tweet_params)
            render json: { tweet: @tweet }, status: :ok
         else
            render json: { errors: @tweet.errors.full_messages }, status: :unprocessable_entity
         end
   end
 
 
   def quote 
     tweet_id = params[:id]  
     user_id = params[:user_id]
     body = params[:body]
     
     @tweet = Tweet.new(user_id: user_id, body: body, quote: true, retweet: false,interaction_reference: tweet_id)
     
     respond_to do |format|
           if @tweet.save
             format.json { render json: { tweet: @tweet }, status: :created }
          else
             format.json { render json: @tweet.errors, status: :unprocessable_entity }
          end
      end
  
   end
 
 
    def retweet
 
        tweet_id = params[:id]  
        user_id = params[:user_id]
 
        @tweet = Tweet.new(user_id: user_id, body: nil, quote: false, retweet: true,interaction_reference: tweet_id)
     
        respond_to do |format|
            if @tweet.save
              format.json { render json: { tweet: @tweet }, status: :created }
            else
                 format.json { render json: @tweet.errors, status: :unprocessable_entity }
            end
        end
    
   end
 

   def show 
    @tweet = Tweet.find(params[:id])
     respond_to do |format|
        #format.html
        format.json {render json: @tweet}
     end
        
   end
 

 
   private
 
   def set_tweet
     @tweet = Tweet.find(params[:id])
   end
 
   def tweet_params
     params.require(:tweet).permit(:body, :quote, :retweet)
   end
 
  
end
