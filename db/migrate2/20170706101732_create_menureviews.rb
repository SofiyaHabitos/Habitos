class CreateMenureviews < ActiveRecord::Migration[5.0]
  def change
    create_table :menureviews do |t|
      t.belongs_to :normal_menu, foreign_key: true
      t.string :answer
      t.belongs_to :image
      t.string :reason
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
