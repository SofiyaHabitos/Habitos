class AddColumnToPlan < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :plan_duplicate, :boolean 
  end
end
