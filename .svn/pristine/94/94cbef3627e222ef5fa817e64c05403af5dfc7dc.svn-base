class CreateStockIns < ActiveRecord::Migration[5.0]
  def change
    create_table :stock_ins do |t|
     t.belongs_to :ingredient, foreign_key: true
      t.float :quantity
      t.belongs_to :unit_of_measurement, foreign_key: true  
      t.string :purchase_from
      t.string :purchase_by
      t.date :date
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
