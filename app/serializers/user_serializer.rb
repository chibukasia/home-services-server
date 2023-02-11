class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :phone, :role, :on_probation, :active, :address, :premium, :full_name 
  has_one :profile
  def full_name
    "#{self.object.first_name.capitalize} #{self.object.last_name.capitalize}"
  end
end
