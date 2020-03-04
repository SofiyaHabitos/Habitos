class Category < ApplicationRecord
	validates :category_name, presence: true,uniqueness: { case_sensitive: false}
	has_many :menu_customers
	acts_as_paranoid
end
