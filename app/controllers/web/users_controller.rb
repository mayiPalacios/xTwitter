class UsersController < ApplicationController

   def create
       @user = FactoryBot.create(:user)
       render_to_json(@user)
   end

   def tweets_and_replies
    user = User.find(params[:id])
    page = params[:page] || 1
    per_page = params[:per_page] || 5 
    @tweets_and_replies = user.tweets_and_replies(page, per_page)
  
    respond_to do |format|
        if @tweets_and_replies
          format.json {
             render json: {
              tweets: @tweets_and_replies[:tweets],
              replies: @tweets_and_replies[:replies],
              pagination: {
               page: page,
               per_page: per_page
              }
             },
             status: :created
          }
          end
       end
  end
  

    private 

     def set_tweet
       @tweet = Tweet.find(params[:id])
     end


end
