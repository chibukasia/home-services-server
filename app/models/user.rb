class User < ApplicationRecord
    has_many :notifications
    has_one :profile 
    has_many :reviews
    has_many :user_services, through: :reviews
    has_many :unlocks
    has_many :user_contracts
end
