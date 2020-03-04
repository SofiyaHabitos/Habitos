class AddProductionItem < ActiveRecord::Migration[5.0]
  def change
    add_column :production_items,:item_code,:string
    add_reference :production_items,:item_subcategory,index:true
  end
end
