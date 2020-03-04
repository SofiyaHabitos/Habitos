class CreateVehicleTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_types do |t|
      t.string :vehicle_type_name
      t.string :type_details
      t.integer :transport_type
      t.integer :status

      t.timestamps
    end
  end
end
