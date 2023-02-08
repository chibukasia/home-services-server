class UserContractsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :contract_not_found
    skip_before_action :authorize, only: [:index]
    def index
        contracts = UserContract.all
        render json: contracts
    end

    def show
        contract = find_contract
        render json: contract, status: :ok
    end

    def create
        contract = current_user.contracts.create!(contract_params)
        render json: contract, status: :created
    end

    def update 
        contract = find_contract
        contract.update!(contract_params)
        render json: contract, status: :accepted
    end

    def destroy
        contract = find_contract
        contract.destroy
        head :no_content
    end

    private 
    def find_contract
        UserContract.find(params[:id])
    end

    def contract_not_found
        render json: {error: "Contract not found"}
    end

    def contract_params
        params.permit(:title, :description, :period, :monthly_pay, :user_id, :id_number, :id_copy)
    end
end
