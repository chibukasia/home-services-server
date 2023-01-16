class ProfilesController < ApplicationController
    skip_before_action :authorize, only:[:create]

    rescue_from ActiveRecord::RecordNotFound, with: :user_profile_not_found
    def show
        profile = find_profile
        render json: profile, status: :ok 
    end

    def index 
        profiles = Profile.all
        render json: profiles
    end
    # def create 
    #     user = find_user
    #     profile = user.create_profile!(profile_params)
    #     render json: profile, status: :created
    # end

    def update 
        profile = find_profile
        profile.update!(profile_params)
        render json: profile, status: :accepted
    end

    def destroy
        profile = find_profile
        profile.destroy
        head :no_content
    end
    # Private methods 
    private 

    def find_profile
        Profile.find_by(user_id: current_user.id)
    end

    def profile_params
        params.permit(:bio, :user_id, :image)
    end

    def user_profile_not_found
        render json: {error: "Profile not found"}, status: :not_found
    end
end
