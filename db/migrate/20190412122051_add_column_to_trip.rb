class AddColumnToTrip < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :trip_cost, :float
    add_column :trips, :trip_distance, :integer
    add_column :trips, :report_time, :string
    add_reference :trip_plans, :tenant, foreign_key: true
  end
end
