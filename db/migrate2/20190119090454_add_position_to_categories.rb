class AddPositionToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :position, :integer
    change_column :tenants, :from_date, :date, :null => true
    change_column :tenants, :to_date, :date, :null => true
  end
end
