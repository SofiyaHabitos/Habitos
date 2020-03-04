class CreateItemCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :item_categories do |t|
      t.belongs_to :category, foreign_key: true  
      t.integer :no_of_category
      t.string :super_category_name
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
