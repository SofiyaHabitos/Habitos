class AddColumnToTenant < ActiveRecord::Migration[5.0]
  def change
    add_column :tenants, :feedback_code, :string
  end
end
