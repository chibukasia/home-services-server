class Profile < ApplicationRecord

    has_one_attached :image
    validates :image, presence: false
    belongs_to :user
    
    # Validations
    # validates :bio, presence: false, length: {minimum: 100, maximum: 1000}
end
