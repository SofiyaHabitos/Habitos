class CreateOperations < ActiveRecord::Migration[5.0]
  def change
    create_table :operations do |t|
      t.string :name
      t.integer :manpower
      t.time :time
      t.float :process_cost
      t.belongs_to :unit_of_measurement, foreign_key: true
      t.float :quantity
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
