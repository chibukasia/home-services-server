class ReviewsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :review_not_found 
    skip_before_action :authorize, only: [:index]

    def index 
        reviews = Review.all
        render json: reviews
    end

    def show 
        review = find_review
        render json: review, status: :ok
    end

    def create 
        review = current_user.reviews.create!(review_params)
        render json: review, status: :created
    end

    def update
        review = find_review
        review.update!(review_params)
        render json: review, status: :accepted
    end

    def destroy
        review = find_review
        review.destroy
        head :no_content
    end

    private

    def review_params 
        params.permit(:rating, :comment, :user_id, :user_service_id)
    end

    def find_review
        Review.find(params[:id])
    end

    def review_not_found
        render json: {error: "User review not found"}, status: :not_found
    end

end
