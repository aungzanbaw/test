json.extract! detail, :id, :order_id, :product_id, :qty, :price, :remark, :created_at, :updated_at
json.url detail_url(detail, format: :json)