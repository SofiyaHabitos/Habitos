class CreateKitchenUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :kitchen_users do |t|
      t.string :name, null: false
      t.string :user_name, null: false
      t.string :password_digest
      t.string :email, null: false
      t.string :mobile_number
      t.text :address
      t.string :auth_token
      t.belongs_to :role, foreign_key: true 
      t.belongs_to :kitchen, foreign_key: true
      t.integer :tenant, array:true ,default:[]
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :kitchen_users, :user_name, unique: true
  end
end
