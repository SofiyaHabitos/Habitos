class Image < ApplicationRecord
has_one :food_group,  :dependent => :destroy
has_one :tenant,  :dependent => :destroy#, :inverse_of => :images
#has_one :image
mount_uploader :image_path, ImageUploader
acts_as_paranoid
#validates :image_path,presence: true
end
