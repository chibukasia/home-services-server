class UsersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :user_not_found 
    before_action :authorize
    skip_before_action :authorize, only:[:create, :index]
    # GET all users 
    def index 
        users = User.all
        render json: users, status: :ok 
    end

    # GET one user
    def show 
        user = find_user 
        # puts user.username
        # binding.break
        render json: user, status: :ok
    end

    # Create a new user 
    def create 
        user = User.create!(user_params)
        profile = user.create_profile!(profile_params)
        session[:user_id] = user.id
        session[:user_role] =user.role
        render json: {user: user, message: "User created succesfully"}, status: :created
    end

    # Update an existing user
    def update
        user = find_user 
        user.update!(user_params)
        render json:{user: user, message: "User updated successfully"}, status: :accepted
    end

    # Delete user account
    def destroy
        user = find_user
        user.destroy
        head :no_content
    end

    # Private methods 
    private 
    
    # Find user
    def find_user
        User.find(session[:user_id])
    end

    def user_params
        params.permit(:username, :first_name, :last_name, :email, :phone, :password, :password_confirmation, :role, :on_probation, :active, :premium, :address )
    end

    def profile_params
        params.permit(:bio, :user_id, :image)
    end
    # User not found response 
    def user_not_found 
        render json: {error: "User not found"}, status: :not_found
    end

    def authorize
        render json: {error: "user not found"}, status: :not_found unless session.include? :user_id
    end
end
