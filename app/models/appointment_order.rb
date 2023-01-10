class AppointmentOrder < ApplicationRecord

    # Relations 
    belongs_to :user
    has_many :incidents

    # Validations 
    validates :date, presence: true, comparison: {greater_than_or_equal_to: :today_date}


    # Get todays date

    def today_date 
        Date.today()
    end
end
