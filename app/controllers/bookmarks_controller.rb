class BookmarksController < ApplicationController
    before_action :set_tweet, only: [:create]
  
    def create
      tweet_id = params[:id]
      user_id = params[:user_id]
  
      if @tweet
        @bookmark = Bookmark.new(tweet_id: tweet_id, user_id: user_id)
        
        if @bookmark.save
            render json: { bookmark: @bookmark }, status: :ok 
          end
      end
    end

   
    
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
  