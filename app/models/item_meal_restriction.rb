class ItemMealRestriction < ApplicationRecord
  belongs_to :production_item
  belongs_to :meal_restriction
  acts_as_paranoid
end
