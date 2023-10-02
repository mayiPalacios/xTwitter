module TweetStatsModule

    extend ActiveSupport::Concern


  included do
    before_action :set_tweet
  end
 def get_Stats

 
 end

  private

  def quoted(id)
       
  end

  def retweeted(id)
    
  end

  def replied(id)
    
  end

  def bookmarked(id)
    
  end

  def liked(id)
    
  end


  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end


end