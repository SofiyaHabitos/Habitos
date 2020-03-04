class TripDetail < ApplicationRecord
	attr_accessor :hours,:mins
  belongs_to :trip
  enum status: {default: 1,InActive: 0,Active: 1,Deleted: 2}
  #enum trip_type: {default: 1,delivery: 1,return: 2 }

end
