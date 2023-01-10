class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :user_service

    # Validations
    validates :rating, presence: true
    validates :comment, presence: true 
end
