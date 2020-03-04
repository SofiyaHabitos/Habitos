class CreateTripDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_details do |t|
      t.string :source
      t.string :destination
      t.string :vehicle_type
      t.integer :distance
      t.float :rate
      t.string :waiting_time
      t.float :waiting_charge
      t.float :serving_charging
      t.string :order_id 
      t.string :job_id
      t.string :trip_type
      t.string :status
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
