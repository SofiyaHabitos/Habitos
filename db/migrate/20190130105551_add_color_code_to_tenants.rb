class AddColorCodeToTenants < ActiveRecord::Migration[5.0]
  def change
    add_column :tenants, :color_code, :string
    add_column :tenants, :gst_number, :string
  end
end
