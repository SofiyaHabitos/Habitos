class AddUnitOfMeasurementToUtensilsCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :utensils_categories, :unit_of_measurement, foreign_key: true
    rename_column :utensils, :weight, :tare_weight
    add_column :utensils, :lid_weight, :decimal
    add_column :feedbacks, :flag, :integer
    add_column :tenants, :meal, :boolean
  end
end
