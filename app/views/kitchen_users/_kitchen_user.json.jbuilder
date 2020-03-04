json.extract! kitchen_user, :id, :name, :user_name, :password_digest, :email, :mobile_number, :address, :auth_token, :kitchen_id, :created_by, :updated_by, :created_at, :updated_at
json.url kitchen_user_url(kitchen_user, format: :json)
