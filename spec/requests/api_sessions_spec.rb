require 'rails_helper'


RSpec.describe 'Sessions', type: :request do

  describe 'POST /api/sign_in' do
    let(:user) { FactoryBot.create(:user) }
    
       it 'log in and return a valid JWT token' do
         user.save!
         get '/api/sign_in', params: { email: user.email, password: "Maria@1234_jjj" }
      
         response.body
         expect(response).to have_http_status(:created)
         expect(JSON.parse(response.body)).to have_key('token')
      end
  end

  describe 'DELETE /api/sign_out' do
    let(:user) { FactoryBot.create(:user,email:"chainsawman@gmail.com",password:'contraseña@dddd92892829',password_confirmation: 'contraseña@dddd92892829') }
    it 'log out and revoke JWT token' do
        user.save!
        valid_params = Api::AuthenticationController.new
        token = valid_params.create("chainsawman@gmail.com",'contraseña@dddd92892829')
        
      get '/api/sign_out', headers: { 'Authorization' => "Bearer #{token}" }, params: { token: token}

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to have_key('invalid_token')
    end
  end
end
