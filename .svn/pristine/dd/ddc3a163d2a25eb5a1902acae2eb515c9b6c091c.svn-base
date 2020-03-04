class CreateProductionItems < ActiveRecord::Migration[5.0]
  def change
    create_table :production_items do |t|
      t.string :name, null: false
      t.belongs_to :production_category, foreign_key: true
      t.decimal :cost
      t.integer :allergy,array: true, default:[]
      t.integer :quantity
      t.belongs_to :unit_of_measurement, foreign_key: true
      t.integer :category,array: true, default: []

      t.timestamps
    end
  end
end
