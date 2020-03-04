class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.belongs_to :question, foreign_key: true  
      t.string :answer
      t.belongs_to :tenant, foreign_key: true
      t.string :meal_time
      t.date :date
      t.belongs_to :image
      t.string :command
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
