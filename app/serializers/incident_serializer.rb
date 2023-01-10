class IncidentSerializer < ActiveModel::Serializer
  attributes :id, :incident_title, :description, :location
end
