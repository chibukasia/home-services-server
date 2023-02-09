class IncidentSerializer < ActiveModel::Serializer
  attributes :id, :incident_name, :incident_description, :incident_location, :resolved, :evidence_urls 
  belongs_to :appointment_order
end
