class CreateIncidents < ActiveRecord::Migration[7.0]
  def change
    create_table :incidents do |t|
      t.string :incident_name
      t.text :incident_description
      t.string :incident_location
      t.references :appointment_order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
