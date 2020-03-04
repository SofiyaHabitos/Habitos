class CreateVesselplanners < ActiveRecord::Migration[5.0]
  def change
    create_table :vesselplanners do |t|
      t.string :menuitem
      t.string :date
      t.string :datetime
      t.references :utensils_category, foreign_key: true
      t.references :utensil, foreign_key: true
      t.references :tenant_detail, foreign_key: true
      t.integer :countdummy

      t.timestamps
    end
  end
end
