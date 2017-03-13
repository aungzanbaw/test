json.extract! customer, :id, :name, :phone, :password, :city, :address, :created_at, :updated_at
json.url customer_url(customer, format: :json)