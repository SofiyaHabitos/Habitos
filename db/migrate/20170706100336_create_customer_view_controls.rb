class CreateCustomerViewControls < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_view_controls do |t|
      t.belongs_to :tenant, foreign_key: true
      t.string :title
      t.string :billing_upload
      t.string :nutrition_upload
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
