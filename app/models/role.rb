class Role < ApplicationRecord
  belongs_to :site_category
  has_many :users, dependent: :destroy
  has_one :kitchen_user, dependent: :destroy
  validates :name,presence: true
  acts_as_paranoid
end
