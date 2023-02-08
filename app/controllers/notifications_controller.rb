class NotificationsController < ApplicationController
    # before_action :authorize
    
    rescue_from ActiveRecord::RecordNotFound, with: :notification_not_found
    def index 
        notifications = Notification.all 
        render json: notifications 
    end 

    def show 
        notification = find_notification
        render json: notification, status: :ok 
    end

    def create 
        notification = Notification.create!(notification_params)
        render json: notification, status: :created
    end

    def update 
        notification = find_notification
        notification.update!(notification_params)
        render json: notification, status: :accepted
    end

    # Private methods 
    private 

    # find notification
    def find_notification
        Notification.find(params[:id])
    end

    def notification_params
        params.permit(:message, :user_id)
    end

    def notification_not_found
        render json: {error: "Notification not found"}, status: :not_found
    end 

end
