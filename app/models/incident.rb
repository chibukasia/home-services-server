class Incident < ApplicationRecord
    # Associations
    belongs_to :appointment_order

    # Validations
    validates :incident_name, presence: true
    validates :incident_description, presence: true, length: {minimum: 100}
    validates :location, presence: true
end
