class CreateKitchens < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchens do |t|
      t.string :name, null: false
      t.string :responsible_person
      t.string :address
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :kitchens, :name, unique: true
  end
end
