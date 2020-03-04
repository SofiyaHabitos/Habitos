class CreateOldEnrolments < ActiveRecord::Migration[5.0]
  def change
    create_table :old_enrolments do |t|
      t.string :name
      t.string :age_type
      t.date   :date_of_birth
      t.float  :height
      t.float  :weight
      t.float :bmi
      t.string :standard
      t.string :id_number
      t.references :food_category, foreign_key: true
      t.string :enrolment_type
      t.references :tenant, foreign_key: true
      t.string :order_source
      t.string :email
      t.string :sex
      t.string :parent_name
      t.string :meal_time
      t.date :from_date
      t.date :to_date
      t.references :meal_restriction, foreign_key: true
      t.text :comment
      t.boolean :is_active
      t.string :status
      t.string :stud_type
      t.string :academic_year

      t.timestamps
    end
  end
end
