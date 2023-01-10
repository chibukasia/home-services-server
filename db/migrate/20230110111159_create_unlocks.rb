class CreateUnlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :unlocks do |t|
      t.integer :total_unlocks
      t.integer :current_unlocks
      t.integer :used_unlocks
      t.integer :remaining_unlocks
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
