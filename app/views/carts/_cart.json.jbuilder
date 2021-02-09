json.extract! cart, :id, :product_id, :quantity, :order_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)
