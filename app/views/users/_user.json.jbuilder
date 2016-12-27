json.extract! user, :id, :business_unit_id, :name, :created_at, :updated_at
json.url user_url(user, format: :json)