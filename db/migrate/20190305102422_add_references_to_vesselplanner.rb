class AddReferencesToVesselplanner < ActiveRecord::Migration[5.0]
  def change
    add_reference :vesselplanners, :tag, foreign_key: true
  end
end
