class API::SessionsController < ApiController
  skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!
  
    def new 
         @user = User.new
    end

    def create
      @user = User.find_by(email: user_params[:email])

      if @user && @user.password == user_params[:password]
        
      else 
       
    end

end

private 

def user_params
      params.require(:user).permit(:email,:password)
end

end