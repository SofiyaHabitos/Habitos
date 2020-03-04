class MenuProductionItem < ApplicationRecord
  belongs_to :menu_master
  belongs_to :production_item
  belongs_to :meal_course
  has_many :dispatches, dependent: :destroy
  has_many :food_returns, dependent: :destroy
  acts_as_paranoid
  
end
