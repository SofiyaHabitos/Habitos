class CreateTripSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :trip_schedules do |t|
      t.date :date
      t.string :trip_name
      t.string :driver_name
      t.string :reporting_time
      t.string :meal_time
      t.string :status
      t.timestamps
    end
  end
end
