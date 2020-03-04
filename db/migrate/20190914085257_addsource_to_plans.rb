class AddsourceToPlans < ActiveRecord::Migration[5.0]
  def change
  	add_column :plans, :source, :integer
  end
end
