class UserServicesController < ApplicationController
    skip_before_action :authorize, only:[:index, :show] 
    rescue_from ActiveRecord::RecordNotFound, with: :user_service_not_found

    def index
        user_services = UserService.all.order(created_at: :desc) 
        render json: user_services
    end

    def create
        user = User.find(current_user.id)
        user_service = user.user_services.create!(user_servicice_params)
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

    def current_user_services 
        user_services=UserService.where(:id== current_user.id).order(created_at: :desc)
        render json: user_services, status: :ok

    end

    def top_rated_services 
        # user_services = User
        # service_reviews = Review.where(service_id: == )
    end
    # Private methods 
    private

    def user_servicice_params
        params.permit(:description, :quotation, :location, :user_id, :service_id, :start_time, :end_time, :image)
    end 

    def find_user_service 
        UserService.find(params[:id])
    end 

    def user_service_not_found
        render json: {error: "User service not found"}, status: :not_found
    end
end
