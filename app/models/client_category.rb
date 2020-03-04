class ClientCategory < ApplicationRecord
	has_many :site_categories, :through => :client_type_categories, dependent: :destroy
 	has_many :client_type_categories
end
