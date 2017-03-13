json.extract! staff, :id, :username, :password, :department_id, :created_at, :updated_at
json.url staff_url(staff, format: :json)