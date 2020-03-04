class AddIsActiveToEnrolment < ActiveRecord::Migration[5.0]
  def change
    add_column :enrolments, :is_active, :boolean, default: true
  end
end
