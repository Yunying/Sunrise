json.array!(@contracts) do |contract|
  json.extract! contract, :id, :title, :client_id, :sign_date, :description, :amount
  json.url contract_url(contract, format: :json)
end
