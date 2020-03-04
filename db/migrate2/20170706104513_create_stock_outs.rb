class CreateStockOuts < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_outs do |t|
      t.belongs_to :ingredient, foreign_key: true
      t.float :quantity
      t.belongs_to :unit_of_measurement, foreign_key: true  
      t.string :taken_by
      t.string :purpose
      t.date :date
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
