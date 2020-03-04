class AddCustomerToTenants < ActiveRecord::Migration[5.0]
  def change
    add_column :tenants, :customer_id, :integer
  end
end
