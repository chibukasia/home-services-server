class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :user_service
end
