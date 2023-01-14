class SessionsController < ApplicationController

    skip_before_action :authorize, only:[:create]
    rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
    def create 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id 
            session[:user_role] = user.role 
            render json: user, status: :created
        else 
            render json: {error: "Invalid username or password"}, status: :unauthorized
        end
    end

    def show 
        user = User.find(session[:user_id])
        render json: user 
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

    # Private 
    private 
    def user_not_found
        render json: {error: "Not authorized"}, status: :unauthorized
    end
end
