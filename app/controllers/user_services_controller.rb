class UserServicesController < ApplicationController
    skip_before_action :authorize, only:[:index, :show] 
    rescue_from ActiveRecord::RecordNotFound, with: :user_service_not_found

    def index
        user_services = UserService.all 
        render json: user_services
    end

    def create
        user = User.find(session[:user_id])
        user_service = user.user_services.create(user_servicice_params)
        render json: user_service, status: :created
    end

    def show 
        user_service = find_user_service
        render json: user_service, status: :ok
    end

    def update 
        user_service = find_user_service
        user_service.update!(user_servicice_params) 
        render json: user_service, status: :accepted
    end

    def destroy
        user_service = find_user_service
        user_service.destroy
        head :no_content
    end

    # Private methods 
    private

    def user_servicice_params
        params.permit(:description, :quotation, :location, :user_id, :service_id)
    end 

    def find_user_service 
        UserService.find(params[:id])
    end 

    def user_service_not_found
        render json: {error: "User service not found"}, status: :not_found
    end
end
