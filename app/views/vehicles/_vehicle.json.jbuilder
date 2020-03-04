json.extract! vehicle, :id, :reg_no, :vehicle_type_id, :vehicle_name, :vehicle_owner, :vehicle_contact_no, :gps_status, :gps_id, :status, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
