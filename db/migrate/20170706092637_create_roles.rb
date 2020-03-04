class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :name
     t.belongs_to :site_category, foreign_key: true
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    add_index :roles, :name, unique: true
  end
end
