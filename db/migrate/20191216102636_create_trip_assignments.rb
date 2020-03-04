class CreateTripAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_assignments do |t|
      t.string :date
      t.string :order_id
      t.string :meal_time
      t.string :trip_name
      t.string :vehicle
      t.string :vehicle_name
      t.string :reg_no
      t.string :driver
      t.string :source
      t.string :destination
      t.integer :count
      t.string :status
      t.string :pickup_time
      t.string :delivery_time
      t.json :job_id
      t.integer :pickup_count
      t.integer :delivery_count
      t.string :total_km
      t.integer :trip_detail_id
      t.string :actual_pickup
      t.string :actual_delivery

      t.timestamps
    end
  end
end
