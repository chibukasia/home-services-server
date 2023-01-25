class UserServiceSerializer < ActiveModel::Serializer
  attributes :id, :description, :quotation, :location, :created_at, :updated_at
end
