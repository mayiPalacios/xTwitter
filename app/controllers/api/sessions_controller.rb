class Api::SessionsController < ApiController
  skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!
    include CreateToken
    
    def create 
      email = params[:email]
      password = params[:password]

      token = create_token(email, password)
      render json: {  token: token }, status: :created
    end

     def destroy
       token = params[:token]
       invalid_token = destroy_token(token)      
       render json: {  invalid_token: invalid_token }, status: :created
     end

end