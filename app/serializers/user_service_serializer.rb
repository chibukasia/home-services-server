class UserServiceSerializer < ActiveModel::Serializer
  attributes :id, :description, :quotation, :location
end
