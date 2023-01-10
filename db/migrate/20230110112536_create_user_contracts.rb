class CreateUserContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_contracts do |t|
      t.string :title
      t.text :description
      t.integer :period
      t.decimal :monthly_pay
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
