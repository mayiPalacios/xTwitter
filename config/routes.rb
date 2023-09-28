Rails.application.routes.draw do
  
  resources :users, only: [:show] do
    resources :tweets, only: [:index]
  end

  resources :users do
    resources :tweets, only: [:new, :create, :update]
  end

  resources :tweets do
    resources :likes, only: [:new, :create, :destroy]
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

  resources :users do
    get "tweets", on: :member, as: :tweets, defaults: { page: 1 }
  end

  resources :users do
    get "tweets_and_replies", on: :member, as: :tweets_and_replies, defaults: { page: 1 }
  end

  resources :tweets do
    get "stats", on: :member, as: :tweet_stats
  end
end
