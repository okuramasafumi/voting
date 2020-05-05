json.extract! event, :id, :owner_id, :name, :created_at, :updated_at
json.url event_url(event, format: :json)
