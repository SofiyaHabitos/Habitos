class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :category
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
