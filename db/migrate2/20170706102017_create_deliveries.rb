class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.date :date
      t.belongs_to :tenant, foreign_key: true
      t.string :remark
      t.string :delivery_status
      t.belongs_to :dispatch, foreign_key: true
      t.string :distance
      t.string :meal_time
      t.string :delivery_time
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
