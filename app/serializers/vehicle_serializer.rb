class VehicleSerializer < ActiveModel::Serializer
  attributes :id, :reg_no, :vehicle_name, :vehicle_owner, :vehicle_contact_no, :gps_status, :gps_id, :status
  has_one :vehicle_type
end
