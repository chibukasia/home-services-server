class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :bio, :image_url
end
