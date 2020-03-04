class CreateMealcounts < ActiveRecord::Migration[5.0]
  def change
    create_table :mealcounts do |t|
      t.string :veg_count
      t.string :non_veg_count
      t.belongs_to :food_category, foreign_key: true
      t.string :meal_time
      t.date :date
      t.belongs_to :tenant, foreign_key: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
