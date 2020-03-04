class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :username
      t.string :age_type
      t.integer :rating
      t.belongs_to :tenant, foreign_key: true
      t.string :favourite_dish
      t.string :least_dish
      t.string :comment
      t.string :reason
      t.date :date
      t.integer :created_by
      t.integer :updated_by


      t.timestamps
    end
  end
end
