class ApplicationController < ActionController::API

    include ActionController::Cookies
    before_action :authorized

    def current_user 
        User.find_by(id: session[:user_id])
    end

    private 

    def authorized 
        render json: {message: 'Please login'}, status: :unauthorized unless login?      
    end

    def login? 
        !!current_user
    end
end

 