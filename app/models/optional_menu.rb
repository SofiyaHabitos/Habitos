class OptionalMenu < ApplicationRecord
  belongs_to :production_item
  belongs_to :unit_of_measurement
  belongs_to :nutrition
  belongs_to :optionalmenu_site
end
