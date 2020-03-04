class VehicleType < ApplicationRecord

	enum transport_type: {others: 0, Car: 1, MotorCycle: 2, Bicycle: 3, Scooter: 4, Foot: 5, Truck: 6}
	enum status: {Inactive: 0,Active: 1,Suspended: 2,Expired: 3}

end
