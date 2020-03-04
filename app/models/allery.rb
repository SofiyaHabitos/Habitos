class Allery < ApplicationRecord
	 validates :name, presence: true,uniqueness: { case_sensitive: false}
	 acts_as_paranoid
end
