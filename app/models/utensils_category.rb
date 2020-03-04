class UtensilsCategory < ApplicationRecord
  has_many :utensils
  belongs_to :unit_of_measurement
  validates :utensils_category_name, presence: true, length: { in: 2..100 },uniqueness: { case_sensitive: false}
  acts_as_paranoid
end
