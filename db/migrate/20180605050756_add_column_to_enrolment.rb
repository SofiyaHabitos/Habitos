class AddColumnToEnrolment < ActiveRecord::Migration[5.0]
  def change
    add_column :enrolments, :academic_year, :string
  end
end
