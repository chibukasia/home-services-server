class UserContractSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :period, :monthly_pay
end