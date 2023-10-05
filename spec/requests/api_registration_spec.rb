

require 'rails_helper'

RSpec.describe 'API Registration', type: :request do
  describe 'POST /api/register' do
   
    it 'creates a new user' do
        user_attributes  = FactoryBot.create(:user) 
        post '/api/register', params: {
          email: "userinventandoddd@gmail.com",
          password:'contraseña@dddd92892829',
          password_confirmation: 'contraseña@dddd92892829',
          username: "chainsawman3",
          name: user_attributes[:name],
          lastname: user_attributes[:lastname]

        }, as: :json

      
      expect(response).to have_http_status(201)

    end
  end
end
