class AddColumnToUtensilsCategory < ActiveRecord::Migration[5.0]
  def change
  add_column :utensils_categories, :upload_status, :string
  add_column :utensils_categories, :asset_type, :string
  end
end
