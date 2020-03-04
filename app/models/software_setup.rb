class SoftwareSetup < ApplicationRecord  
  belongs_to :user
  accepts_nested_attributes_for :user
  acts_as_paranoid
  #validates :software_privileges, presence: true
end
