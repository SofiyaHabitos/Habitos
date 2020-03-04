class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.belongs_to :ingredient_category, foreign_key: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :ingredients, :name, unique: true
  end
end
