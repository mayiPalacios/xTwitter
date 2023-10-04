class API::SessionsController < ApiController
    skip_before_action :authenticate_user!
  
    def new 
         @user = User.new
    end

    def create
      @user = User.find_by(email: user_params[:email])

      if @user && @user.password == user_params[:password]
         cookies.encrypted.signed[:user_id] = @user.id 
      else 
        flash.now[:notice] = "Invalid email or password"
        render :new 
    end

end

private 

def user_params
      params.require(:user).permit(:email,:password)
end

end