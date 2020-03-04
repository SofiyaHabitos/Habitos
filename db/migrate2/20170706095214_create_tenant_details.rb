class CreateTenantDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :tenant_details do |t|
      t.string :meal_plan
      t.string :meal_time
      t.string :order
      t.integer :quantity
      t.integer :actval_quantity
      t.belongs_to :tenant, foreign_key: true 
      t.float :cost
      t.belongs_to :food_category, foreign_key: true 
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
