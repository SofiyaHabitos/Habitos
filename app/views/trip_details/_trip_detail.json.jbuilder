json.extract! trip_detail, :id, :source, :destination, :vehicle_type, :distance, :rate, :waiting_time, :waiting_charge, :serving_charging, :trip_id, :created_at, :updated_at
json.url trip_detail_url(trip_detail, format: :json)
