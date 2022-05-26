json.extract! item, :id, :title, :category, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
