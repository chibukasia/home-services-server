class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :phone, :password_digest, :role, :on_probation, :active, :address, :premium
end
