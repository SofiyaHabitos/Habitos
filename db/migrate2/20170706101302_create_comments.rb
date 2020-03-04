class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :othercomment
      t.belongs_to :tenant, foreign_key: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
