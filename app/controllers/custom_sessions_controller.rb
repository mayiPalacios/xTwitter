class CustomSessionsController < Devise::SessionsController
    protected
  
    def after_sign_in_path_for(resource)
        home_path(resource) 
    end
  end
  