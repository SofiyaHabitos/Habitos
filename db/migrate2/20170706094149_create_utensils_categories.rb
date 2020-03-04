class CreateUtensilsCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :utensils_categories do |t|
      t.string :utensils_category_name, null: false
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    add_index :utensils_categories, :utensils_category_name, unique: true
  end
end
