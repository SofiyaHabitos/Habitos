class CreateMenuCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_cycles do |t|
      t.references :sub_plan, foreign_key: true
      t.references :category, foreign_key: true
      t.text :menu_items
      t.datetime :date
      t.references :tenant_detail, foreign_key: true

      t.timestamps
    end
  end
end
