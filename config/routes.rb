Rails.application.routes.draw do
  get 'tweets/create'
  get 'tweets/update'
  
  resources :users, only: [:show] do
    resources :tweets, only: [:index]
  end

  
  resources :tweets, only: [:new,:create,:update,:index,:show], defaults: { format: :json }
  

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end

  resources :tweets do
    member do
      post "quote", defaults: { format: :json }
      post "retweet",  defaults: { format: :json }
    end
  end

  resources :tweets do
    resources :replies, only: [:create], param: :tweet_id
  end

  resources :tweets do
    resources :bookmarks, only: [:create, :destroy], defaults: { format: :json }
  end
  

   resources :users, only:[:show,:index] do
    get "tweets", on: :member, as: :tweets
   get "tweets_and_replies", on: :member, as: :tweets_and_replies
  end

  resources :tweets do
    get "stats", on: :member, as: :tweet_stats
  end
end
