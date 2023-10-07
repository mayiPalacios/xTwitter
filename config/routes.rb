Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root 'default#home'

  get '/home', to: 'default#home'

namespace :api, defaults: { format: :json } do
  
  post '/register', to: 'registration#create' 
  get '/sign_in', to: 'sessions#create'
  get  '/sign_out', to: 'sessions#destroy'
   


      resources :users, only: [:show, :index] do
        resources :tweets, only: [:index]
        get "tweets_and_replies", on: :member, as: :tweets_and_replies
     end

    resources :tweets, only: [:new, :create, :update, :index, :show] do
        post "quote", on: :member
        post "retweet",  on: :member
        resources :bookmarks, only: [:create, :destroy, :show]
        get "stats", on: :member, as: :tweet_stats
    end
  
  
        resources :tweets do
        resources :likes, only: [:create, :destroy]
     end

       resources :tweets do
       resources :replies, only: [:create], param: :tweet_id
     end

end

namespace :web  do

 
  resources :users, only: [:show, :index] do
    resources :tweets, only: [:index]
    get "tweets_and_replies", on: :member, as: :tweets_and_replies
 end

 resources :tweets, only: [:new, :create, :update, :index, :show] do
    post "quote", on: :member
    post "retweet", on: :member
    resources :bookmarks, only: [:create, :destroy]
    get "stats", on: :member, as: :tweet_stats
 end




 resources :tweets do
    resources :likes, only: [:create, :destroy]
 end

  resources :tweets do
    resources :replies, only: [:create], param: :tweet_id
  end

  get "user/:username", to: "users#show_by_username", as: :user_by_username

end




 
  # resources :tweets do
  #   member do
  #     post "quote", defaults: { format: :json }
  #     post "retweet",  defaults: { format: :json }
  #   end
  # end

   # resources :users, only: [:show] do
  #   resources :tweets, only: [:index]
  # end

  
  # resources :tweets, only: [:new,:create,:update,:index,:show], defaults: { format: :json }

  

  # resources :tweets do
  #   resources :bookmarks, only: [:create, :destroy], defaults: { format: :json }
  # end
  

  #  resources :users, only:[:show,:index] do
  #   get "tweets", on: :member, as: :tweets
  #  get "tweets_and_replies", on: :member, as: :tweets_and_replies
  # end

  # resources :tweets do
  #   get "stats", on: :member, as: :tweet_stats
  # end
end
