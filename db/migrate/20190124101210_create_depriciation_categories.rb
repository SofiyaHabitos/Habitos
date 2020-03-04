class CreateDepriciationCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :depriciation_categories do |t|
      t.string :name
      t.text :description
      t.float :depreciation_percentage

      t.timestamps
    end
  end
end
