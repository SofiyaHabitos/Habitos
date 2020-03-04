class ProductionIngredient < ApplicationRecord
  belongs_to :production_item
  belongs_to :ingredient ,optional:true
  belongs_to :unit_of_measurement
end
