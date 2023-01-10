class Notification < ApplicationRecord
    belongs_to :user

    # Validations
    validates :message, presence: true, length: {minimum: 20}
end
