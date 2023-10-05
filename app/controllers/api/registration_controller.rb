class Api::RegistrationController < ApiController
  skip_before_action :authenticate_user!
  include CreateToken

  def create
    email = params[:email]
    password = params[:password]
    username = params[:username]
    name = params[:name]
    lastname = params[:lastname]

    @user = User.new(
      email: email,
      password: password,
      username: username,
      name: name,
      lastname: lastname
    )
  
    @user.save!
    if @user
      token = create_token(@user.email, password) 
      render json: { user: @user, token: token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end

  end
  
end
