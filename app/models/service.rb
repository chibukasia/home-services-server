class Service < ApplicationRecord
    # belongs_to :profession
    has_many :user_services

    # Validations 
    validates :service_name, presence: true
    validates :description, presence: true, length: {minimum: 100, maximum: 1000}
end
