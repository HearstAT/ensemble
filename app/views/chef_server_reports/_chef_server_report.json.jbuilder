json.extract! chef_server_report, :id, :business_unit_id, :number_of_nodes, :number_of_users, :number_of_cookbooks, :created_at, :updated_at
json.url chef_server_report_url(chef_server_report, format: :json)
