class Standard < ApplicationRecord
	belongs_to :tenant
	validates :standard, presence: true#, uniqueness: true
	acts_as_paranoid
end
