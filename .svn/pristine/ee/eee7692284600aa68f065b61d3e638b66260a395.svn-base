class CreateAuditreviews < ActiveRecord::Migration[5.0]
  def change
    create_table :auditreviews do |t|
      t.string :correct
      t.string :incorrect
      t.date :date
      t.belongs_to :tenant, foreign_key: true
      t.string :meal_time
      t.string :category
      t.string :rating
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
