class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.belongs_to :tenant, foreign_key: true 
      t.string :name
      t.string :user_name
      t.string :password_digest
      t.string :email
      t.string :mobile_number
      t.text :address
      t.string :auth_token
      t.belongs_to :role, foreign_key: true 
      t.belongs_to :kitchen, foreign_key: true 
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :users, :user_name, unique: true
  end
end
