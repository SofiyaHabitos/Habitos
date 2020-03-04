class CreatePointOfSales < ActiveRecord::Migration[5.0]
  def change
    create_table :point_of_sales do |t|
      t.date :date
      t.belongs_to :tenant, foreign_key: true
      t.string :meal_time
      t.integer :quantity
      t.integer :actual_qty
      t.belongs_to :food_category, foreign_key: true
      t.string :time
      t.string :comment
      t.integer :flag

      t.timestamps
    end
  end
end
