class Api::BookmarksController < ApiController

    def create
        tweet_id = params[:tweet_id]
        user_id = params[:user_id]
    
        if @tweet
          @bookmark = Bookmark.new(tweet_id: tweet_id, user_id: user_id)
        
          
          if @bookmark.save
            render :create, status: :created
          else
            render json: { errors: @bookmark.errors.full_messages }, status: :unprocessable_entity
          end
  
     
      end
  
    end
    
    before_action :set_tweet, only: [:create]
      def destroy
          id = params[:id]
  
          @bookmark = Bookmark.find(params[:id]) 
          if @bookmark.destroy
              render json: { message: 'Bookmark successfully deleted' }, status: :ok
            end
        end
        
    
      private
    
      
      def set_tweet
        @tweet = Tweet.find_by(id: params[:tweet_id])
      end




end