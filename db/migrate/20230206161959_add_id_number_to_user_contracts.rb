class AddIdNumberToUserContracts < ActiveRecord::Migration[7.0]
  def change
    add_column :user_contracts, :id_number, :bigint
  end
end
