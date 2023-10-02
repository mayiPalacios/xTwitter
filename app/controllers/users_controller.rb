class UsersController < ApplicationController
    def create
        @user = FactoryBot.create(:user)
        render_to_json(@user)
        end

        def tweets_and_replies
          
         user_id = params[:id]
         page = params[:page]
         per_page = params[:per_page]
              
       @tweets =  Tweet.where(user_id: user_id)
       @replies = Reply.where(user_id: user_id)
       
        
        
        @tweets_and_replies = (@tweets + @replies).order(created_at: :desc).page(page).per(per_page)
        


          # @tweets_and_replies = (@tweets + @replies).page(page).per(per_page)
     
       # @tweets_and_replies = Tweet.where(user_id: user_id).or(Reply.where(user_id: user_id)).order(created_at: :desc).paginate(page: page, per_page: per_page)
        # @tweets_and_replies = Tweet.tweets_and_replies_by_user(user_id).page(page).per(per_page)
       #  @count_tweets_replies = Tweet.tweets_and_replies_by_user(user_id).count

         
        # response_data = {
         #  tweets_and_replies: @tweets_and_replies,
           # pagination: {
            #  page: page,
        #      per_page: per_page,
        #      total_elements: @count_tweets_replies
         #   }
        #  }

          render json: @tweets_and_replies,status: :ok

        end

 private 


 def set_tweet
    @tweet = Tweet.find(params[:id])
  end



end
