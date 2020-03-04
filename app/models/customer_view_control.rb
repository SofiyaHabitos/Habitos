class CustomerViewControl < ApplicationRecord
  belongs_to :tenant
  mount_uploader :billing_upload, ImageUploader
  mount_uploader :nutrition_upload, ImageUploader
  mount_uploader :bill, ImageUploader
  validates :billing_upload,:tenant_id,:nutrition_upload,:bill,presence: true
  acts_as_paranoid

end
