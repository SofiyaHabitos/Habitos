class VehicleTypeSerializer < ActiveModel::Serializer
  attributes :id, :vehicle_type_name, :type_details, :transport_type, :status
end
