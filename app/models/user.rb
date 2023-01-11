class User < ApplicationRecord

    has_secure_password

    #Associations
    has_many :notifications, dependent: :destroy
    has_one :profile, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :user_services, through: :reviews, dependent: :destroy
    has_many :unlocks, dependent: :destroy
    has_many :user_contracts, dependent: :destroy
end
