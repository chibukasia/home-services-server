class IncidentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :incident_not_found
    def index 
        incidents = Incident.all 
        render json: incidents
    end 

    def create 
        incident = Incident.create!(incident_params)
        render json: {incident: incident, message: "Incident Reported Succesfully"}, status: :created 
    end 

    def show 
        incident = find_incident
        render json: incident, status: :ok 
    end 

    def update 
        incident = find_incident 
        incident.update!(user_params)
    end 

    def destroy 
        incident = find_incident
        incident.destroy
        head :no_content
    end

    # Private params 
    private 
    def incident_params 
        params.permit(:incident_name, :incident_description, :incident_location, :appointment_order_id)
    end 

    def find_incident 
        Incident.find(params[:id])
    end 

    def incident_not_found 
        render json: {error: "incident not found"}, status: :not_found
    end
end
