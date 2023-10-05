module CreateToken

def create_token(email,password)
    valid_params = Api::AuthenticationController.new
    token = valid_params.create(email,password)
    token
end



end