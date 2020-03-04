class CreateWastages < ActiveRecord::Migration[5.0]
  def change
    create_table :wastages do |t|
      t.date :date
      t.string :meal_time
      t.belongs_to :tenant, foreign_key: true 
      t.float :wastage_quantity
      t.belongs_to :unit_of_measurement, foreign_key: true 
      t.float :total_qty
      t.belongs_to :image
      t.string :remark
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
