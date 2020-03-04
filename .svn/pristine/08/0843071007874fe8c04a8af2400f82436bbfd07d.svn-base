class CreateItemSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :item_subcategories do |t|
      t.string :name
      t.string :description
      t.integer :create_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :item_subcategories, :name, unique: true
  end
end
