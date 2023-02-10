class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :phone, :role, :on_probation, :active, :address, :premium
end
