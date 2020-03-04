class CreateClientTypeCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :client_type_categories do |t|
      t.references :site_category, foreign_key: true
      t.references :client_category, foreign_key: true

      t.timestamps
    end
  end
end
