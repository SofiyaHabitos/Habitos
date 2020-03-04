class CreateSubPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_plans do |t|
      t.string :name
      t.references :plan, foreign_key: true
      t.references :site_category, foreign_key: true
      t.references :category, foreign_key: true
      t.references :food_category, foreign_key: true
      t.string :stud_type
      t.string :spread_type

      t.timestamps
    end
  end
end
