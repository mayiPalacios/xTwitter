module CreateToken

    def create_token(email,password)
       valid_params = Api::AuthenticationController.new
       token = valid_params.create(email,password)
       token
  end

    def destroy_token(token)
      invalid_token = Api::AuthenticationController.new
      invalid_token = invalid_token.destroy(token)
      invalid_token
   end


end