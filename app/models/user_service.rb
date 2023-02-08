class UserService < ApplicationRecord
    has_many :appointment_orders
    has_many :reviews
    # has_many :users, through: :reviews
    belongs_to :user
    belongs_to :service 
    has_one_attached :image

    # Validations 
    validates :description, presence: true, length: {minimum: 100, maximum: 1000}
    validates :location, presence: true
    validates :quotation, presence: true, comparison: {greater_than_or_equal_to: 50}
    validates :image, presence: true 

    def image_url
        Rails.application.routes.url_helpers.url_for(image) if image.attached?
    end
end
