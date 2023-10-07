class Web::UsersController < ApplicationController



   def create
       @user = FactoryBot.create(:user)
       render_to_json(@user)
   end


 
   def show_by_username
    @user = User.find_by(username: params[:username])

    if @user
      # Recopila la información necesaria, como nombre, apellido, bio, fecha de unión, etc.
      @tweets = @user.tweets.paginate(page: params[:page], per_page: 5)

      render 'show_by_username'
    else
      # Maneja el caso en que no se encuentra el usuario por su nombre de usuario
      redirect_to root_path, alert: "Usuario no encontrado"
    end
  end

    def index

    
  

    end


   def tweets_and_replies
    user = User.find(params[:id])
    page = params[:page] || 1
    per_page = params[:per_page] || 5 
    @tweets_and_replies = user.tweets_and_replies(page, per_page)
  
    respond_to do |format|
        if @tweets_and_replies
          format.json {
             render json: {
              tweets: @tweets_and_replies[:tweets],
              replies: @tweets_and_replies[:replies],
              pagination: {
               page: page,
               per_page: per_page
              }
             },
             status: :created
          }
          end
       end
  end
  

    private 

     def set_tweet
       @tweet = Tweet.find(params[:id])
     end


end
