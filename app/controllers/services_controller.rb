class ServicesController < ApplicationController
    skip_before_action :authorize, only:[:index, :show]
    rescue_from ActiveRecord::RecordNotFound, with: :service_not_found

    def index 
        services = Service.all
        render json: services
    end

    def show 
        service = find_service
        render json: service, status: :ok 
    end

    def create
        if current_user
            service = Service.create!(service_params)
            render json: service, status: :created
        else
            unauthorized_user
        end
    end

    def update
        service = find_service
        if current_user
            service.update!(service_params)
            render json: {service: service, message: "Service updated successfully"}, status: :accepted
        else
            unauthorized_user
        end
    end

    def destroy
        service = find_service
        if current_user
            service.destroy
            head :no_content
        else
            unauthorized_user
        end
    end

    # Private methods
    private 

    def find_service
        Service.find(params[:id]) 
    end

    def service_params
        params.permit(:service_name, :description)
    end 

    def service_not_found
        render json: {error: "Service not found"}, status: :not_found
    end

    def unauthorized_user
        render json: {error: "Unauthorized user"}, status: :unauthorized
    end
end
