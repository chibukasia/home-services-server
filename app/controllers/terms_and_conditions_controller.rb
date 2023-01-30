class TermsAndConditionsController < ApplicationController

    def index 
        terms = TermsAndCondition.all 
        render json: terms
    end

    def create
        term = TermsAndCondition.create!(term_params)
        render json: term, status: :created 
    end

    def update
        term = find_term
        term.update!(term_params)
        render json: term, status: :accepted
    end

    def destroy
        term = find_term
        term.destroy
        head :no_content
    end

    # Private methods 
    private 

    def term_params
        params.permit(:description)
    end

    def find_term
        TermsAndCondition.find(params[:id])
    end

    def term_not_found
        render json:{error: "Term and condition not found"}, status: :not_found
    end
end
