json.extract! new_relic_config, :id, :business_unit_id, :account_number, :api_key, :created_at, :updated_at
json.url new_relic_config_url(new_relic_config, format: :json)