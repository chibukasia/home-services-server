class IncidentsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :incident_not_found
    def index 
        incidents = Incident.all 
        render json: incidents
    end 

    def create 
        incident = Incident.create!(incident_params)
        # incident = appointment_order.incidents.create!(incident_params)
        render json: incident, status: :created 
        # puts params[:appointment_order_id].to_i
        # appointment_order = AppointmentOrder.find(params[:appointment_order_id])
        # if (appointment_order)

        # # puts params
            
        # else 
        #     render json: {error: "Appointment not found"}
        # end
    end 

    def show 
        incident = find_incident
        render json: incident, status: :ok 
    end 

    def update 
        incident = find_incident 
        incident.update!(user_params)
        render json: incident, status: :accepted
    end 

    def destroy 
        incident = find_incident
        incident.destroy
        head :no_content
    end

    # TODO LATER 
    def resolved_incidents
    end

    def unresolved_incidents
    end

    def service_person_incidents
    end 

    def user_incidents
    end
    # Private params 
    private 
    def incident_params 
        params.require(:incident).permit(:incident_name, :incident_description, :incident_location, :appointment_order_id, :resolved, evidences: [])
    end 

    def find_incident 
        Incident.find(params[:id])
    end 

    def incident_not_found 
        render json: {error: "incident not found"}, status: :not_found
    end
end
