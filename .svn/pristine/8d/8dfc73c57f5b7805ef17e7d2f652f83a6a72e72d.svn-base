class CreateInventoryLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :inventory_logs do |t|
      t.belongs_to :stock_in, foreign_key: true
      t.belongs_to :stock_out, foreign_key: true
      t.belongs_to :ingredient, foreign_key: true
      t.float :quantity
      t.belongs_to :unit_of_measurement, foreign_key: true  
      t.boolean :log_status ,default: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
