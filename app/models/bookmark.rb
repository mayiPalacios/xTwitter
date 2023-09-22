class Bookmark < ApplicationRecord
  belongs_to :user 
  belongs_to :tweet 

  scope :bookmarked_tweets_by_user, -> (user_id){
    where(user_id: user_id)
  }

  scope :create_sample_bookmark, -> {
    create([
      {  user_id: 1, tweet_id: 2 },
      { user_id: 2 ,  tweet_id: 8},
      { user_id: 3 ,  tweet_id: 3},
      { user_id: 4  , tweet_id: 4},
      { user_id: 5 , tweet_id: 6 },
      { user_id: 1, tweet_id: 7  },
      { user_id: 2, tweet_id: 4 },
      { user_id: 3 , tweet_id: 2 },
      { user_id: 4, tweet_id: 4 },
      { user_id: 5, tweet_id: 8  }
    ])
  }

end
