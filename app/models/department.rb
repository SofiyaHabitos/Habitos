class Department < ApplicationRecord
	 has_many :utensils, dependent: :destroy
end
