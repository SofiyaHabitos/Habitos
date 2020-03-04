class CreateDispatchUtensilsMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :dispatch_utensils_mappings do |t|
      t.belongs_to :dispatch, foreign_key: true
      t.belongs_to :utensil, foreign_key: true
      t.belongs_to :normal_menu, foreign_key: true
      t.string :status
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
