class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :category_name, null: false
      t.string :description
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :categories, :category_name, unique: true
  end
end
