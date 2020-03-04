class SubPlan < ApplicationRecord
  belongs_to :plan
  belongs_to :site_category
  belongs_to :category
  belongs_to :food_category

  has_many :menu_planners
  has_many :menu_cycle
end
