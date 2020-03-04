class CreateNutritions < ActiveRecord::Migration[5.0]
  def change
    create_table :nutritions do |t|
      t.belongs_to :production_item, foreign_key: true 
      t.float :protein, null: false
      t.float :fat, null: false
      t.float :carbohydrates, null: false
      t.float :fibre, null: false
      t.json :minerals,default: "{}", null: false
      t.json :vitamins,default: "{}", null: false
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
