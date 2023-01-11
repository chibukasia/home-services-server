class ProfilesController < ApplicationController
    before_action :authorize
    skip_before_action: authorize, only:[:create]

    rescue_from ActiveRecord::RecordNotFound, with: :user_profile_not_found
    def show
        profile = find_profile
        render json: profile, status: :ok 
    end

    def create 
        user = find_user
        profile = user.create_profile!(profile_params)
        render json: profile, status: :created
    end

    def update 
        profile = find_profile
        profile.update!(profile_params)
        render json: profile, status: :accepted
    end

    # Private methods 
    private 

    # Find user 
    def find_user 
        User.find(session[:user_id])
    end 

    def find_profile
        Profile.find_by(user_id: session[:user_id])
    end

    def profile_params
        params.permit(:bio, :user_id, :image)
    end

    def user_profile_not_found
        render json: {error: "Profile not found"}, status: :not_found
    end

    def authorize
        render json: {error: "Login or Signup to continue"}, status: :unauthorized
    end
end
