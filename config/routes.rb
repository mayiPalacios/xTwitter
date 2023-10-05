Rails.application.routes.draw do
  devise_for :users
  

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

namespace :web, defaults: { format: :json } do

 
  resources :users, only: [:show, :index], defaults: { format: :json } do
    resources :tweets, only: [:index]
    get "tweets_and_replies", on: :member, as: :tweets_and_replies
 end

 resources :tweets, only: [:new, :create, :update, :index, :show], defaults: { format: :json } do
    post "quote", defaults: { format: :json }, on: :member
    post "retweet", defaults: { format: :json }, on: :member
    resources :bookmarks, only: [:create, :destroy], defaults: { format: :json }
    get "stats", on: :member, as: :tweet_stats
 end


 resources :tweets do
    resources :likes, only: [:create, :destroy]
 end

  resources :tweets do
    resources :replies, only: [:create], param: :tweet_id
  end


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
