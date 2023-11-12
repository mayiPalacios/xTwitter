module TweetStatsModule

    extend ActiveSupport::Concern


  included do
    before_action :set_tweet
  end
 def stats()
    
     id = params[:id]

     @result = { 
      quote: self.quoted(id),
      retweet: self.retweeted(id),
      reply: self.replied(id),
      bookmark: self.bookmarked(id),
      like: self.liked(id)
    }
    
      
 
 end

  private

  def quoted(id)
    @count_quote = Tweet.count_quotes(id)
  end

  def retweeted(id)
    @count_retweet = Tweet.count_retweet(id)
  end

  def replied(id)
      @count_reply = Reply.where(user_id: id).count
  end

  def bookmarked(id)
     @count_bookmark = Bookmark.where(user_id: id).count
  end

  def liked(id)
     @count_like = Like.where(user_id: id)
  end


  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end


end