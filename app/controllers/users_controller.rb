class UsersController < ApplicationController
    skip_before_action :authorize, only:[:create, :index]
    wrap_parameters format: []
    # GET all users 
    def index 
        users = User.all
        render json: users, status: :ok 
    end

    # GET one user
    def show 
        # user = current_user
        render json: current_user, status: :ok
    end

    # Create a new user 
    def create 
        user = User.create!(user_params)
        profile = user.create_profile!(profile_params)
        token = encode_token(user_id: user.id)
        render json: {user: user, message: "User created succesfully", jwt: token}, status: :created
    end

    # Update an existing user
    def update
        user = current_user
        user.update!(user_params)
        render json:{user: user, message: "User updated successfully"}, status: :accepted
    end

    # Delete user account
    def destroy
        user = current_user
        user.destroy
        head :no_content
    end

    # Private methods 
    private 
    
    def user_params
        params.permit(:username, :first_name, :last_name, :email, :phone, :password, :password_confirmation, :role, :on_probation, :active, :premium, :address )
    end

    def profile_params
        params.permit(:bio, :user_id, :image)
    end
end
