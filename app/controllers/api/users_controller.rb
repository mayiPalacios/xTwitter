class Api::UsersController < ApiController
    
   def create
      @user = FactoryBot.create(:user)
      render_to_json(@user)
  end

  def tweets_and_replies
   user = User.find(params[:id])
   page = params[:page] || 1
   per_page = params[:per_page] || 5 
   @tweets_and_replies = user.tweets_and_replies(page, per_page)
 
 
     if @tweets_and_replies
      render :tweets_and_replies, status: :created
     end
   
 end
 

   private 

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

end