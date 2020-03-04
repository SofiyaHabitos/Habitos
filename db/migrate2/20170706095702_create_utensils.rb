class CreateUtensils < ActiveRecord::Migration[5.0]
  def change
    create_table :utensils do |t|
      t.string :utensil_name, null: false
      t.string :utensiltype
      t.belongs_to :utensils_category, foreign_key: true
      t.integer :status,default: 1,    null: false
      t.boolean :available_status, default: true
      t.belongs_to :kitchen, foreign_key: true
      t.string :tracking
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :utensils, :utensil_name, unique: true
  end
end
