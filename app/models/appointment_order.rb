class AppointmentOrder < ApplicationRecord

    # Relations 
    belongs_to :user
    has_many :incidents
end
