class API::RegistrationController < ApiController
    skip_before_action :authenticate_user!
    include CreateToken

  def create()

   user = User.new(user_params)


  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:username,:name,:lastname)
end


end