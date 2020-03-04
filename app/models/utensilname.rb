class Utensilname < ApplicationRecord
	has_many :utensils
	#validates :name, presence: true
end
