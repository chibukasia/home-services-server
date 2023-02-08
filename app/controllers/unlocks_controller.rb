class UnlocksController < ApplicationController

    def create
        unlocks = current_user.unlocks.create!(unlock_params) 
        render json: unlocks, status: :created
    end

    def update
        unlock = Unlock.find(params[:id])
        if unlock
            unlock.update!(unlock_params)
            render json: unlock, status: :accepted
        else 
            render json: {error: "unlock not found"}, status: :not_found
        end
    end

    private 
    def unlock_params
        params.permit(:used_unlocks, :remaining_unlocks, :total_unlocks, :current_unlocks, :user_id)
    end
end
