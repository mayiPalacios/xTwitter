Rails.application.routes.draw do
  
  resources :users, only: [:show] do
    resources :tweets, only: [:index]
  end

  
  resources :tweets, only: [:new, :create, :update]
  

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end

  resources :tweets do
    member do
      post "quote"
      post "retweet"
    end
  end

  resources :tweets do
    resources :replies, only: [:create], param: :tweet_id
  end

  resources :tweets do
    resources :bookmarks, only: [:create, :destroy], on: :member
  end

   resources :users, only:[:show] do
    get "tweets(/page/:page)", on: :member, as: :tweets, :default => { per_page: 30}
   get "tweets_and_replies", on: :member, as: :tweets_and_replies
  end

  #get "/users/:id/tweets?per_page=#&&page=#", to: 'users#tweets'
  
  #get "/users/:id/tweets_and_replies?per_page=&&page=", to: 'users#tweets_and_replies'

  resources :tweets do
    get "stats", on: :member, as: :tweet_stats
  end
end
