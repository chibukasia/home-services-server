class Profile < ApplicationRecord

    has_one_attached :image
    belongs_to :user
    
    # Validations
    validates :bio, length: {minimum: 100, maximum: 1000}
end
