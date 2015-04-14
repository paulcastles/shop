json.array!(@items) do |item|
  json.extract! item, :id, :name, :manufacturer, :price, :category, :picture
  json.url item_url(item, format: :json)
end
