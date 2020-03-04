class CreateAuditFeedbackCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :audit_feedback_categories do |t|
      t.string :category_name
      t.string :category_desc
      t.integer :status

      t.timestamps
    end
  end
end
