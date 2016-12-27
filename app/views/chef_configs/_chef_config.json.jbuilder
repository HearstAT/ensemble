json.extract! chef_config, :id, :business_unit_id, :chef_server_url, :chef_organization, :admins, :created_at, :updated_at
json.url chef_config_url(chef_config, format: :json)