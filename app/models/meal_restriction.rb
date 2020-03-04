class MealRestriction < ApplicationRecord
	has_many :tenant_details
	has_many :point_of_sales
	has_many :menu_customers
	has_many :parent_orders
	has_many :enrolments
	has_many :item_meal_restrictions
	has_many :menu_master
	validates :meal_restriction_name, presence: true, length: { in: 3..100 },uniqueness: { case_sensitive: false}
	has_many :old_enrolments

	acts_as_paranoid
	
end
