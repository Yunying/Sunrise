json.array!(@clients) do |client|
  json.extract! client, :id, :name, :address, :telephone, :email
  json.url client_url(client, format: :json)
end
