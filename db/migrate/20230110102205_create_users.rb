class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :role
      t.boolean :on_probation
      t.boolean :active
      t.string :address
      t.boolean :premium

      t.timestamps
    end
  end
end
