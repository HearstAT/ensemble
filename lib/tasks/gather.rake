require 'httparty'
require 'net/http'
require 'net/https'

namespace :gather do
  desc 'TODO'
  task chef: :environment do
  end

  desc 'TODO'
  task new_relic: :environment do
    NewRelicConfig.all.each do |nr|
      headers = {
        'X-Api-Key' => nr.api_key
      }
      response = HTTParty.get('https://api.newrelic.com/v2/applications.json',
                              headers: headers)

      applications = response.parsed_response['applications']
      applications.each do |app|
        puts '************'
        puts app.inspect
        puts "app id is: #{app['id']}"
        puts '************'
        if NewRelicApplication.exists?(new_relic_application_id: app['id'])
          nr_app = NewRelicApplication.find_by(new_relic_application_id: app['id'])
          puts "found #{app['id']}"
        else
          nr_app = NewRelicApplication.new
          nr_app.new_relic_application_id = app['id']
          puts "new #{app['id']}"
        end
        nr_app.new_relic_config_id = nr.id
        nr_app.name
        nr_app.language = app['language']
        nr_app.health_status = app['health_status']
        nr_app.reporting = app['reporting']
        if app['reporting']
          nr_app.last_reported_at = app['last_reported_at']
          nr_app.response_time = app['application_summary']['response_time']
          nr_app.throughput = app['application_summary']['throughput']
          nr_app.error_rate = app['application_summary']['error_rate']
          nr_app.apdex_target = app['application_summary']['apdex_target']
          nr_app.apdex_score = app['application_summary']['apdex_score']
          nr_app.host_count = app['application_summary']['host_count']
          nr_app.instance_count = app['application_summary']['instance_count']
        end
        nr_app.save!
      end
    end
  end

  desc 'Gathers the incidents data for the last twelve months for all configured pagerduty accounts'
  task pagerduty_incidents: :environment do
    since_date = 12.months.ago.beginning_of_day.iso8601
    until_date = Time.now.utc.iso8601
    uri = URI("https://api.pagerduty.com/reports/raw/incidents.csv?since=#{since_date}&until=#{until_date}")

    # Create client
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    PagerDutyConfig.all.each do |pd|
      # Create Request
      req = Net::HTTP::Get.new(uri)
      req.add_field 'Authorization', "Token token=#{pd.api_key}"
      req.add_field 'Accept', 'application/vnd.pagerduty+json;version=2'

      begin
        res = http.request(req)
        puts "Response HTTP Status Code: #{res.code}"

        CSV::Converters[:blank_to_nil] = lambda do |field|
          field && field.empty? ? nil : field
        end
        csv = CSV.new(res.body, headers: true, header_converters: :symbol, converters: [:all, :blank_to_nil])
        puts csv
        csv_hash = csv.to_a.map(&:to_h)
      rescue StandardError => e
        puts "HTTP Request failed (#{e.message})"
      end

      csv_hash.each do |incident|
        unless PagerDutyService.exists?(pager_duty_service_id: incident[:service_id])
          pds = PagerDutyService.new
          pds.pager_duty_config_id = pd.id
          pds.pager_duty_service_id = incident[:service_id]
          pds.name = incident[:service_name]
          pds.save!
        end
        if PagerDutyIncident.exists?(pager_duty_id: incident[:id])
          pdi = PagerDutyIncident.find_by(pager_duty_id: incident[:id])
        else
          # else create new incident
          pdi = PagerDutyIncident.new
          pdi.pager_duty_id = incident[:id]
        end
        pdi.business_unit = pd.business_unit
        pdi.incident_number = incident[:incident_number]
        pdi.description = incident[:description]
        pdi.service_id = incident[:service_id]
        pdi.service_name = incident[:service_name]
        pdi.escalation_policy_id = incident[:escalation_policy_id]
        pdi.escalation_policy_name = incident[:escalation_policy_name]
        pdi.created_on = incident[:created_on]
        pdi.resolved_on = incident[:resolved_on]
        pdi.seconds_to_first_ack = incident[:seconds_to_first_ack]
        pdi.seconds_to_resolve = incident[:seconds_to_resolve]
        pdi.auto_resolved = incident[:auto_resolved]
        pdi.escalation_count = incident[:escalation_count]
        pdi.auto_escalation_count = incident[:auto_escalation_count]
        pdi.acknowledge_count = incident[:acknowledge_count]
        pdi.assignment_count = incident[:assignment_count]
        pdi.acknowledged_by_user_ids = incident[:acknowledged_by_user_ids]
        pdi.acknowledged_by_user_names = incident[:acknowledged_by_user_names]
        pdi.assigned_to_user_ids = incident[:assigned_to_user_ids]
        pdi.assigned_to_user_names = incident[:assigned_to_user_names]
        pdi.resolved_by_user_id = incident[:resolved_by_user_id]
        pdi.resolved_by_user_name = incident[:resolved_by_user_name]
        pdi.urgency = incident[:urgency]
        pdi.save!
      end
    end
  end

  desc 'Deprecated this was the first attempt'
  task pagerduty: :environment do
    SINCE_DATE = 6.months.ago.beginning_of_day.iso8601
    UNTIL_DATE = Time.now.utc.iso8601
    TIMEFRAME = 'monthly'.freeze

    PagerDutyConfig.all.each do |pd|
      ENDPOINT = "https://#{pd.sub_domain}.pagerduty.com/api/v1/reports/" \
                "incidents_per_time/?since=#{SINCE_DATE}&until=#{UNTIL_DATE}" \
                "&rollup=#{TIMEFRAME}".freeze
      TOKEN_STRING = "Token token=#{pd.api_key}".freeze

      response = HTTParty.get(
        ENDPOINT,
        headers: {
          'Content-Type' => 'application/json',
          'Authorization' => TOKEN_STRING
        }
      )

      puts '********** parsed response ********'
      puts response.parsed_response['incidents'].inspect
      response.parsed_response['incidents'].each do |data|
        puts '********** data ********'
        puts data
        pdr = PagerDutyReport.new
        pdr.business_unit = pd.business_unit
        pdr.number_of_incidents = data['number_of_incidents']
        pdr.active = true
        pdr.start_date = data['start']
        pdr.end_date = data['end']
        pdr.save!
      end
      puts '********** response body ********'
      puts response.body
    end
  end
end
