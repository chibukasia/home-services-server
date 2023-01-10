class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :service_name
      t.text :description
      # t.references :profession, null: true, foreign_key: true

      t.timestamps
    end
  end
end
