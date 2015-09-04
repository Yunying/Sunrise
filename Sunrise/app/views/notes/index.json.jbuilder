json.array!(@notes) do |note|
  json.extract! note, :id, :content, :contract_id, :invoice_id, :order_id
  json.url note_url(note, format: :json)
end
