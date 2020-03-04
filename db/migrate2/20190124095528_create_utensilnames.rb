class CreateUtensilnames < ActiveRecord::Migration[5.0]
  def change
    create_table :utensilnames do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
