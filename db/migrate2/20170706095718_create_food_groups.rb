class CreateFoodGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :food_groups do |t|
      t.string :meal_time
       t.belongs_to :food_category, foreign_key: true  
      t.text :description
      t.integer :created_by
      t.integer :updated_by
      t.belongs_to :image, foreign_key: true  
      t.timestamps
    end
  end
end
