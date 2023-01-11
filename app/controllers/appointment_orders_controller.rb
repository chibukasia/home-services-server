class AppointmentOrdersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :appointment_order_not_found
    # GET all the appointment orders
    def index 
        appointment_orders = AppointmentOrder.all
        render json: appointment_orders
    end

    # GET one appointment order 
    def show 
        appointment_order = find_appointment_order 
        render json: appointment_order, status: :ok
    end

    # CREATE new appointement order
    def create 
        
    end

    # UPDATE an existing appointment
    def update
        appointment_order = find_appointment_order
        appointment_order.update!(appointment_order_params)
        render json: appointment_order, status: :accepted
    end

    # DELETE an appointment order
    def destroy 
        appointment_order = find_appointment_order
        appointment_order.destroy
        head :no_content
    end

    # Private methods 
    private 

    # Find an appointment order
    def find_appointment_order
        AppointmentOrder.find(params[:id])
    end

    # Appointment order params 
    def appointment_order_params
        params.permit(:appointment_date, :user_service_id)
    end

    def appointment_order_not_found
        render json: {error: "Appointment order not found"}, status: :not_found
    end

end
