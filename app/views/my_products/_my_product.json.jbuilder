json.extract! my_product, :id, :title, :quantity, :created_at, :updated_at
json.url my_product_url(my_product, format: :json)
