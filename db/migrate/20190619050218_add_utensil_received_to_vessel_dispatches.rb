class AddUtensilReceivedToVesselDispatches < ActiveRecord::Migration[5.0]
  def change
    add_column :vessel_dispatches, :utensil_received, :boolean, :default => false
  end
end
