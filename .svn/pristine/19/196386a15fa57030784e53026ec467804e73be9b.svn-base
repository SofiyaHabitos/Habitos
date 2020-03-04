class ProductionCategory < ApplicationRecord
	validates :name, presence: true,uniqueness: { case_sensitive: false}
	acts_as_paranoid
	#has_many :production_items, dependent: :destroy
end
