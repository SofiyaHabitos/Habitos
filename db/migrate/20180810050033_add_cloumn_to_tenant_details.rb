class AddCloumnToTenantDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :tenant_details, :delivery_time, :string
    add_column :tenant_details, :dispatch_time, :string
    add_column :tenant_details, :spread_type, :string
  end
end
