class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_name, :description
end
