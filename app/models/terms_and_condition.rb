class TermsAndCondition < ApplicationRecord
    # Validations 
    validates :description, presence: true 
end
