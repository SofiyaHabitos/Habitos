class ChangeIntegerFormatInProductionItems < ActiveRecord::Migration[5.0]
  
  def up
    change_column :production_items, :quantity, :float
  end

  def down
    change_column :production_items, :quantity, :integer
  end
end
