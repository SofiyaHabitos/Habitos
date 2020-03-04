class AddColumnsToDrivers < ActiveRecord::Migration[5.0]
  def change
    # add_column :drivers, :username, :string
    # add_column :drivers, :password, :string
    add_column :drivers, :email, :string
    #add_column :drivers, :vehicle_desc, :string
    #add_column :drivers, :color, :string
    #add_column :drivers, :timezone, :string
    add_column :drivers, :team_id, :string
    add_column :drivers, :last_name, :string
    add_column :drivers, :role_id, :integer
    add_column :drivers, :fleet_id, :integer
    add_column :drivers, :licence_no, :string
    add_column :drivers, :license_exp, :datetime
    add_column :drivers, :driver_image, :string
    add_column :drivers, :reg_no, :string
    add_column :drivers, :vehicle_owner, :string
    add_column :drivers, :vehicle_contact, :string
  end
end
