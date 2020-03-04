class AddColToPos < ActiveRecord::Migration[5.0]
  def change
     add_reference :attendances, :normalmenu_site, foreign_key: true
     add_reference :parent_orders, :food_category, foreign_key: true
     add_column :production_items, :created_by, :integer
     add_column :production_items, :updated_by, :integer
     
  end
end
