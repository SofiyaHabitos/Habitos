class AddcolumnToVesselDispatch < ActiveRecord::Migration[5.0]
  def change
  add_column :vessel_dispatches, :status, :string
  end
end
