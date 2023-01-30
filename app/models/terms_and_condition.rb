class TermsAndCondition < ApplicationRecord
    # Validations 
    validates :description, presence: true, length: {minimum: 50} 
end
