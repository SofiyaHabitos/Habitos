class Vehicle < ApplicationRecord
  belongs_to :vehicle_type

  enum status: {Inactive: 0,Active: 1,Suspended: 2,Expired: 3}
  #validates :vehicle_contact_no, :numericality => true, :length => { :minimum => 10, :maximum => 10}
  #validates_format_of :reg_no, :with =>  /{a-zA-Z0-9-}/
 
end
 #/{^[a-zA-Z\d ]*$}/i