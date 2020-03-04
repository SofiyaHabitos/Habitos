class AddColumnNutrition < ActiveRecord::Migration[5.0]
  def change
   add_column :nutritions, :caloire, :float
  add_column :normalmenu_sites, :time, :string
  end
end
