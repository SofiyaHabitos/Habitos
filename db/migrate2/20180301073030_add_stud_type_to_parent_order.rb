class AddStudTypeToParentOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_customers, :stud_type, :string
    add_column :parent_orders, :stud_type, :string
    add_column :point_of_sales, :stud_type, :string
    add_column :enrolments, :stud_type, :string
  end
end
