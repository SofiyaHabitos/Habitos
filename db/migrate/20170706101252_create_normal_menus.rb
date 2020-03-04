class CreateNormalMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :normal_menus do |t|
      t.float :quantity
      t.belongs_to :nutrition, foreign_key: true
      t.belongs_to :normalmenu_site, foreign_key: true
      t.belongs_to :food_category, foreign_key: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
