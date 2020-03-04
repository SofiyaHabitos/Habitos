class DriverSerializer < ActiveModel::Serializer
  attributes :id, :driver_name, :vehicle_no, :vehicle_type, :contact_no, :proof
end
