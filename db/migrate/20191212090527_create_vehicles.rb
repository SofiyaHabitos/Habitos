class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.string :reg_no
      t.references :vehicle_type, foreign_key: true
      t.string :vehicle_name
      t.string :vehicle_owner
      t.string :vehicle_contact_no
      t.boolean :gps_status ,default: false
      t.string :gps_id
      t.integer :status

      t.timestamps
    end
  end
end
