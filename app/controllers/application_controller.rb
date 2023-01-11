class ApplicationController < ActionController::API

    wrap_parameters format: []
    # Enable all controllers to work with cookies
    include ActionController::Cookies
    # Rescue from invalid user responses
    rescue_from ActiveRecord::RecordInvalid, with: :response_to_unprocessable_entity

    # Private methods
    private

    def response_to_unprocessable_entity(invalid) 
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity 
    end
end
