class MealCourse < ApplicationRecord
	acts_as_paranoid
	validates :meal_course_name, presence: true, length: { in: 3..100 },uniqueness: { case_sensitive: false}
	validates :position, presence: true, :numericality => true
  	has_many :item_meal_courses
	has_many :menu_production_items
end
