class CreateSiteCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :site_categories do |t|
      t.string :name, null: false
      t.string :description
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :site_categories, :name, unique: true
  end
end
