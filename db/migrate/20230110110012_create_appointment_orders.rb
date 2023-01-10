class CreateAppointmentOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :appointment_orders do |t|
      t.datetime :appointment_date
      t.references :user_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
