class ApplicationController < ActionController::API
    before_action :authorize
    wrap_parameters format: []
    # Rescue from invalid user responses
    rescue_from ActiveRecord::RecordInvalid, with: :response_to_unprocessable_entity


    def encode_token(payload)
        JWT.encode(payload, 'user')
    end 

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'user', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user 
        if decoded_token
            user_id = decoded_token[0]['user_id'] 
            user = User.find_by(id: user_id)       
        end
    end

    def logged_in?
        !!current_user
    end
    private

    def response_to_unprocessable_entity(invalid) 
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity 
    end

     # Authorize users
     def authorize 
        render json: {error: "Login or signup to continue"}, status: :unauthorized unless logged_in?
    end
end
