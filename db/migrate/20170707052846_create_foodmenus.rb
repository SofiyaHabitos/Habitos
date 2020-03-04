class CreateFoodmenus < ActiveRecord::Migration[5.0]
  def change
    create_table :foodmenus do |t|
      t.belongs_to :tenant, foreign_key: true
      t.string :date
      t.string :date
      t.string :meal_time
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
