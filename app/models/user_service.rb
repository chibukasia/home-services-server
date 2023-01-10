class UserService < ApplicationRecord
    has_many :appointment_orders
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :service 
end
