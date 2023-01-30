class AddStartTimeToUserServices < ActiveRecord::Migration[7.0]
  def change
    add_column :user_services, :start_time, :string
  end
end
