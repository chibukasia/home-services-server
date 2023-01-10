class UnlockSerializer < ActiveModel::Serializer
  attributes :id, :total_unlocks, :current_unlocks, :used_unlocks, :remaining_unlocks
end
