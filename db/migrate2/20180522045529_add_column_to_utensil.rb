class AddColumnToUtensil < ActiveRecord::Migration[5.0]
  def change
    add_column :utensils, :count, :integer
    add_column :utensils, :upload_status, :string
    add_column :utensils, :count_dummy, :integer
    add_column :utensils, :asset_type, :string
    add_column :utensils, :depriciation_category, :string
    add_column :utensils, :purchase_date, :datetime
    add_column :utensils, :vendor, :string
    add_column :utensils, :volume, :integer
    add_column :utensils, :amc, :datetime
    add_column :utensils, :depriciation_percentage, :float
    add_column :utensils, :warranty, :datetime
    remove_reference :utensils, :utensils_category, foreign_key: true
    remove_column :utensils, :utensiltype, :string
    remove_column :utensils, :utensil_name, :string
    add_reference :utensils, :utensilname, foreign_key: true
    add_reference :utensils, :department, foreign_key: true
  end
end
