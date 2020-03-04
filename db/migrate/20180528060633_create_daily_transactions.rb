class CreateDailyTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_transactions do |t|
      t.string :date
      t.string :tenant_name
      t.string :category_name
      t.string :stud_type
      t.string :menu_master_name
      t.integer :pack_to_send
      t.string :meal_restriction_name
      t.string :food_category
      t.text :items

      t.timestamps
    end
  end
end
