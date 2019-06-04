json.extract! invoice, :id, :creation_date, :end_date, :total, :user_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
