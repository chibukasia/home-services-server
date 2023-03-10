class UserService < ApplicationRecord
    has_many :appointment_orders
    has_many :reviews
    # has_many :users, through: :reviews
    belongs_to :user
    belongs_to :service 
    has_many_attached :images

    # Validations 
    validates :description, presence: true, length: {minimum: 100, maximum: 1000}
    validates :location, presence: true
    validates :quotation, presence: true, comparison: {greater_than_or_equal_to: 50, message: "Must be more than Ksh 50"}
    validates :images, presence: true 
    validate :must_have_at_least_three_images 

    def must_have_at_least_three_images
        unless  images.length >= 3
            errors.add(:images, "At least three images are needed")
        end
    end

    def image_urls
        images.map do |image|  
            Rails.application.routes.url_helpers.url_for(image)
        end
    end
end
