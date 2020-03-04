class CreateVesselDispatches < ActiveRecord::Migration[5.0]
  def change
    create_table :vessel_dispatches do |t|
      t.datetime :date
      t.references :category, foreign_key: true
      t.hstore :menuitem
      t.references :utensil, foreign_key: true
      t.references :tag, foreign_key: true
      t.references :tenant_detail, foreign_key: true
      t.integer :count
      t.float :wastage

      t.timestamps
    end
  end
end
