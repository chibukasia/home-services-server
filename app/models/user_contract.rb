class UserContract < ApplicationRecord
    belongs_to :user

    # Validations 
    validates :title, presence: true 
    validates :description, presence: true, length: {minimum: 100}
    validates :monthly_pay, presence: true, comparison: {greater_than_or_equal_to: 3000}
    validates :period, presence: true
end
