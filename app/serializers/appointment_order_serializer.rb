class AppointmentOrderSerializer < ActiveModel::Serializer
  attributes :id, :appointment_date, :status, :created_at, :updated_at
  belongs_to :user_service
  belongs_to :user
  has_many :incidents
end
