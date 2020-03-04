class AddColumnToSubPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :sub_plans, :meal_time, :string
    remove_reference :sub_plans , :category, index: true, foreign_key: true
  end
end
