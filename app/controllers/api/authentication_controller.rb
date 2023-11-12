class Api::AuthenticationController < ApiController
skip_before_action :authenticate_user!  

   def create(email,password)
        user = User.find_by(email: email)
      
        if  user.valid_password?(password) 
          token = JsonWebToken.encode(sub: user.id)
        else
          render json: { errors: @bookmark.errors.full_messages }
            render json: { errors: ["Invalid email or password"]}              
        end

   end

   
   def destroy(token)
      
    invalid_token = JsonWebToken.decode(token)
 
   end


end

