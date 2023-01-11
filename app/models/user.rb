class User < ApplicationRecord

    has_secure_password

    #Associations
    has_many :notifications, dependent: :destroy
    has_one :profile, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :user_services, through: :reviews
    has_many :unlocks, dependent: :destroy
    has_many :user_contracts, dependent: :destroy

    # Validations
    validates :email, uniqueness: true, presence: true 
    validates :username, uniqueness: true, length:{minimum: 3, maximum: 15}, presence: true
    validates :phone, uniqueness: true, presence: true, {minimum: 9, maximum: 13} 
    validates :first_name, presence: true 
    validates :last_name, presence: true
    # validates :role, presence: true
    
end
