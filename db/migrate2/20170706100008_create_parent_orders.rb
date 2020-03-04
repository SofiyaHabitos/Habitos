class CreateParentOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :parent_orders do |t|
      t.string :identity_number
      t.float :amount
      t.belongs_to :tenant, foreign_key: true
      t.string :status
      t.date :date
      t.string :meal_time
      t.string :flag
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
