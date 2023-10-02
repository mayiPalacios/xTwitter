class UsersController < ApplicationController
    def create
        @user = FactoryBot.create(:user)
        render_to_json(@user)
        end
end
