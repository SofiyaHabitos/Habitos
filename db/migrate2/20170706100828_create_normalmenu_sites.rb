class CreateNormalmenuSites < ActiveRecord::Migration[5.0]
  def change
    create_table :normalmenu_sites do |t|
      t.date :date
      t.string :meal_time
      t.integer :flag
      t.string :delivery_status
      t.string :status
      t.belongs_to :tenant, foreign_key: true
      t.string :meal_type
      t.integer :menu_detail,array:true, default:[]
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
