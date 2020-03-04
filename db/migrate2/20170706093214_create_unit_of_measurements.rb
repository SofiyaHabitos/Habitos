class CreateUnitOfMeasurements < ActiveRecord::Migration[5.0]
  def change
    create_table :unit_of_measurements do |t|
      t.string :name, null: false
      t.string :description
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :unit_of_measurements, :name, unique: true
  end
end
