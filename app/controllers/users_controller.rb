class UsersController < ApplicationController
skip_before_action :authorized, only: [:create]

    def show
        render json: current_user, status: :ok
    end
  

    def create 
        user = User.new(user_params)

        if user.save
            session[:user_id] = user.id
            render json: user, status: 201
        else
            render json: { errors: user.errors.full_messages }, status: 422
        end
        
    end
    private

    def user_params
        params.permit(:name, :email, :password)
    end
end