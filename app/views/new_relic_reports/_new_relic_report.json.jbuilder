json.extract! new_relic_report, :id, :business_unit_id, :number_of_servers, :number_of_apps, :created_at, :updated_at
json.url new_relic_report_url(new_relic_report, format: :json)