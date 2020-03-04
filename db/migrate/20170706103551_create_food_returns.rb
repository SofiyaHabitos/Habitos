class CreateFoodReturns < ActiveRecord::Migration[5.0]
  def change
    create_table :food_returns do |t|
      t.date :date
      t.belongs_to :tenant, foreign_key: true
      t.string :meal_time
      t.string :reason
      t.belongs_to :normal_menu, foreign_key: true
      t.string :remark
      t.belongs_to :image
      t.float :quantity
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
