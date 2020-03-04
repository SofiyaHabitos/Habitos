class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
      t.string :age_type
      t.boolean :attendance_log, default: true
      t.belongs_to :tenant, foreign_key: true
      t.date :date
      t.string :identity_number
      t.string :standard
      t.string :meal_time
      t.belongs_to :enrolment, foreign_key: true
      t.belongs_to :food_category, foreign_key: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
