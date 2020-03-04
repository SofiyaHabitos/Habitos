class AddTenantToStandard < ActiveRecord::Migration[5.0]
  def change
    add_reference :standards, :tenant, foreign_key: true
  end
end
