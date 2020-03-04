class CreateDeliveryHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_histories do |t|
      t.date :date
      t.belongs_to :tenant, foreign_key: true
      t.string :start_time
      t.string :stop_time
      t.string :pause_time, array: true
      t.string :resume_time, array: true
      t.string :meat_time
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
