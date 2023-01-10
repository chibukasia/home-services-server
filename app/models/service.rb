class Service < ApplicationRecord
    # belongs_to :profession
    has_many :user_services
end
