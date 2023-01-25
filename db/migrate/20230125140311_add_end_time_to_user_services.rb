class AddEndTimeToUserServices < ActiveRecord::Migration[7.0]
  def change
    add_column :user_services, :end_time, :datetime
  end
end
