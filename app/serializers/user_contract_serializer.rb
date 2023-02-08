class UserContractSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :period, :monthly_pay, :id_number, :id_copy_url
end
