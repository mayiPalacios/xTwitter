class Api::LikesController < ApiController
  skip_before_action :authenticate_user!
    before_action :set_tweet

    def create
        user_id = params[:user_id]
    
      
        if @tweet.likes.exists?(user_id: user_id)
          render json: { message: 'you have already liked this tweet' }, status: :unprocessable_entity
        else
          @like = @tweet.likes.new(user_id: user_id)
    
          if @like.save
            render :create, status: :created
          else
            render json: { errors: @like.errors.full_messages }, status: :unprocessable_entity
          end
        end
      end

      def destroy
        id = params[:id]

        @like = Like.find(params[:id]) 
         
        if @like.destroy
          render json: { message: 'Like remove it' }, status: :ok
        end
      end

    private

    def set_tweet
        @tweet = Tweet.find(params[:tweet_id])
      end

end