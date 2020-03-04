class CreateTripPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_plans do |t|
      t.references :driver, foreign_key: true
      t.references :trip, foreign_key: true
      t.datetime :date
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
