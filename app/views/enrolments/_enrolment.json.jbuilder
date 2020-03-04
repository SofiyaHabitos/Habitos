json.extract! enrolment, :id, :name, :age_type, :date_of_birth, :height, :weight, :bmi, :standard, :id_number, :meal_plan, :meal_time, :food_category_id, :from_date, :to_date, :enrolment_type, :payment, :tenant_id, :user_id, :created_at, :updated_at
json.url enrolment_url(enrolment, format: :json)
