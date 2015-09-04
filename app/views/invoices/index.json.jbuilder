json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :client_id, :invoice_number, :invoice_date, :total_number
  json.url invoice_url(invoice, format: :json)
end
