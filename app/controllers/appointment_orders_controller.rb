class AppointmentOrdersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :appointment_order_not_found
    # GET all the appointment orders
    def index 
        appointment_orders = AppointmentOrder.all.order(created_at: :desc)
        render json: appointment_orders
    end

    # GET one appointment order 
    def show 
        appointment_order = find_appointment_order 
        render json: appointment_order, status: :ok
    end

    # CREATE new appointement order
    def create 
        # puts params[:id]
        # binding.break
        # user_service = UserService.find(params[:user_service_id])
        # puts user_service
        # binding.break
        appointment_order = current_user.appointment_orders.create!(appointment_order_params)
        render json: {appointement: appointment_order, message: "Your appointment has been sent"}, status: :created
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

    def overdue_appointments
        appointment_orders = AppointmentOrder.where(:appointment_date < Time.now )
        render json: appointment_orders, status: :ok
    end

    def user_appointments 
        appointements = AppointmentOrder.where(user_id: current_user.id).order(created_at: :desc) 
        render json: appointements, status: :ok
    end

    def service_person_appointments 

    end
    # def service_person_overdue_appointements
    #     @overdue_appointments = []
    #     if current_user.role == "service_person" 
    #         user_services = UserService.where(user_id: current_user.id ) 
    #         user_services.each do |service|
    #             appointments=AppointmentOrder.where(:user_service_id== service.id && :appointment_date< Time.now)
    #             @overdue_appointments <<< appointements
    #         end
    #     end
    #     render json: @overdue_appointments.flatten(1), status: :ok
    # end
    # Private methods 
    private 

    # Find an appointment order
    def find_appointment_order
        AppointmentOrder.find(params[:id])
    end

    # Appointment order params 
    def appointment_order_params
        params.permit(:appointment_date, :user_service_id, :status, :user_id)
    end

    def appointment_order_not_found
        render json: {error: "Appointment order not found"}, status: :not_found
    end

end
