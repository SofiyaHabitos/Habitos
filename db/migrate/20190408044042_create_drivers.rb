class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :driver_name
      t.string :vehicle_no
      t.string :vehicle_type
      t.string :contact_no
      t.string :proof
      
      t.timestamps
    end
  end
end
