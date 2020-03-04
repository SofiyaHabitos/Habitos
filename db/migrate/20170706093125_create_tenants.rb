class CreateTenants < ActiveRecord::Migration[5.0]
  def change
    create_table :tenants do |t|
      t.string :name, null: false
      t.string :description
      t.string :email, null: false
      t.boolean :sex
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.date :from_date, null: false
      t.date :to_date, null: false
      t.string :contact_person1, null: false
      t.string :contact_person2
      t.string :phone1, null: false
      t.string :phone2
      t.string :address, null: false
      t.integer :exclude
      t.boolean :active,default: true
      t.belongs_to :image, foreign_key: true
      t.belongs_to :kitchen, foreign_key: true
      t.belongs_to :site_category, foreign_key: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :tenants, :name, unique: true
  end
end
