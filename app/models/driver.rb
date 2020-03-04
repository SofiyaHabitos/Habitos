class Driver < ApplicationRecord
	mount_uploader :proof, ImageUploader
	#validates_uniqueness_of :username
	 validates :username,length: 3..70, allow_blank: { on: :update }, presence: { on: :create }
	 validates :password,length: 4..70, allow_blank: { on: :update }, presence: { on: :create }

end
