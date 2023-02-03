class AppointmentOrder < ApplicationRecord

    # Relations 
    belongs_to :user
    belongs_to :user_service
    has_many :incidents

    # Validations 
    validates :appointment_date, presence: true, comparison: {greater_than_or_equal_to: :today_date}


    # Get todays date

    def today_date 
        Date.today()
    end
end
