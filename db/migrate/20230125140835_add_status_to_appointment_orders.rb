class AddStatusToAppointmentOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :appointment_orders, :status, :string
  end
end
