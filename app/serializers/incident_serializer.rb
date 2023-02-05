class IncidentSerializer < ActiveModel::Serializer
  attributes :id, :incident_name, :incident_description, :incident_location, :resolved
  belongs_to :appointment_order
end
