class AppointmentOrderSerializer < ActiveModel::Serializer
  attributes :id, :appointment_date, :status
  belongs_to :user_service
end
