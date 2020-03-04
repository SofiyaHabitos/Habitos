class Trip < ApplicationRecord
	has_many :trip_details
	accepts_nested_attributes_for :trip_details, :allow_destroy => true
	validates_uniqueness_of :trip_name
end
