class UserServiceSerializer < ActiveModel::Serializer
  attributes :id, :description, :quotation, :location, :created_at, :updated_at, :start_time, :end_time, :image_urls
  belongs_to :service
  belongs_to :user
end
