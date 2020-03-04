class AddColumnToTenantDetail < ActiveRecord::Migration[5.0]
  def change
    add_column :tenant_details, :stud_type, :string
  end
end
