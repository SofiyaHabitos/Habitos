class AddStudTypeToMenuMaster < ActiveRecord::Migration[5.0]
  def change
    add_column :menu_masters, :stud_type, :string
  end
end
