json.extract! venue, :id, :rows, :columns, :name, :created_at, :updated_at
json.url venue_url(venue, format: :json)
