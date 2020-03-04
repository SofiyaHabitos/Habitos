class CreateDispatches < ActiveRecord::Migration[5.0]
  def change
    create_table :dispatches do |t|
      t.date :date
      t.belongs_to :tenant, foreign_key: true
      t.belongs_to :normal_menu, foreign_key: true
      t.belongs_to :utensil, foreign_key: true
      t.belongs_to :unit_of_measurement, foreign_key: true
      t.float :quantity
      t.string :meal_time
      t.string :status
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
