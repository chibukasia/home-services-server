class Incident < ApplicationRecord
    # Associations
    belongs_to :appointment_order
    has_one_attached :evidence

    # Validations
    validates :incident_name, presence: true
    validates :incident_description, presence: true, length: {minimum: 100}
    validates :incident_location, presence: true
    validates :evidence, presence: true
end
