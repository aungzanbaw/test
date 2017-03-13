json.extract! product, :id, :name, :brand, :group, :price, :department_id, :created_at, :updated_at
json.url product_url(product, format: :json)