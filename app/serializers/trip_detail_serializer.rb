class TripDetailSerializer < ActiveModel::Serializer
  attributes :id, :source, :destination, :vehicle_type, :distance, :rate, :waiting_time, :waiting_charge, :serving_charging, :trip_type
  has_one :trip
end
