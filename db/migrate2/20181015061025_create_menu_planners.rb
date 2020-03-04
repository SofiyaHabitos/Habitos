class CreateMenuPlanners < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_planners do |t|
      t.references :category, foreign_key: true
      t.references :sub_plan, foreign_key: true
      t.text :menu_items 
      t.string :date
      t.references :tenant_detail, foreign_key: true

      t.timestamps
    end
  end
end
