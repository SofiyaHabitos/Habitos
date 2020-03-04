class AddColorCodeToTenants < ActiveRecord::Migration[5.0]
  def change
    add_column :tenants, :color_code, :string
  end
end
