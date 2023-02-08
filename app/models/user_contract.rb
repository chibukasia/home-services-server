class UserContract < ApplicationRecord
    belongs_to :user
    has_one_attached :id_copy 


    # Validations 
    validates :title, presence: true 
    validates :description, presence: true, length: {minimum: 100}
    validates :monthly_pay, presence: true, comparison: {greater_than_or_equal_to: 3000}
    validates :period, presence: true
    validates :id_copy, presence: true

    def id_copy_url
        Rails.application.routes.url_helpers.url_for(id_copy) if id_copy.attached?
    end
end
