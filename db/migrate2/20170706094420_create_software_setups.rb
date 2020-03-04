class CreateSoftwareSetups < ActiveRecord::Migration[5.0]
  def change
    create_table :software_setups do |t|
      t.boolean :software_privileges
      t.belongs_to :user, foreign_key: true
      t.boolean :attendance
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
