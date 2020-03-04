class AddColumnToMenuCycle < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_cycles, :quantity, :float
    add_column :menu_cycles, :status , :string
 
  end
end
