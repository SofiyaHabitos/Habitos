class CreateEnrolments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrolments do |t|
      t.string :name
      t.string :age_type
      t.date :date_of_birth
      t.float :height
      t.float :weight
      t.float :bmi
      t.string :standard
      t.string :id_number
      t.belongs_to :food_category, foreign_key: true
      t.string :enrolment_type
      t.belongs_to :tenant, foreign_key: true
      t.string :order_source
      t.string :email
      t.string :sex
      t.string :parent_name
      t.string :meal_time
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
