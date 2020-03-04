class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.integer :rfid
      t.string :warrenty
      t.string :auto_id
      t.references :utensil, foreign_key: true

      t.timestamps
    end
  end
end
