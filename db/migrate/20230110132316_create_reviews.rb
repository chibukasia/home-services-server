class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.decimal :rating
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :user_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
