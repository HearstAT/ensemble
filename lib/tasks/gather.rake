# frozen_string_literal: true

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
      response = HTTParty.get('https://api.newrelic.com/v2/applications.json', headers: headers)

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
    PagerDutyConfig.all.each do |pd|
      if pd.initial
        limit = 1000
        uri = URI("https://api.pagerduty.com/incidents?date_range=all&time_zone=UTC&limit=#{limit}")
      else
        since_date = 2.months.ago.beginning_of_day
        until_date = Time.now.iso8601
        limit = 100
        uri = URI("https://api.pagerduty.com/incidents?since=#{since_date}&until=#{until_date}&time_zone=UTC&limit=#{limit}")
      end

      headers = { Authorization: "Token token=#{pd.api_key}", Accept: 'application/vnd.pagerduty+json;version=2' }
      response = HTTParty.get(uri, headers: headers)
      incidents = response['incidents'] if response.success?
      raise "Invalid request, Code: #{response.code} & Response: #{response.body}" unless response.success?

      incidents.each do |incident|
        unless PagerDutyService.exists?(pager_duty_service_id: incident['service']['id'])
          pds = PagerDutyService.new
          pds.pager_duty_config_id = pd.id
          pds.pager_duty_service_id = incident['service']['id']
          pds.name = incident['service_name']
          pds.save!
        end

        if PagerDutyIncident.exists?(pager_duty_id: incident['id'])
          pdi = PagerDutyIncident.find_by(pager_duty_id: incident['id'])
        else
          # else create new incident
          pdi = PagerDutyIncident.new
          pdi.pager_duty_id = incident['id']
        end

        pdi.business_unit = pd.business_unit
        pdi.incident_number = incident['incident_number']
        pdi.description = incident['description']
        pdi.service_id = incident['service']['id']
        pdi.service_name = incident['service']['name']
        pdi.escalation_policy_id = incident['escalation_policy'].blank? ? nil : incident['escalation_policy']['id']
        pdi.escalation_policy_name = incident['escalation_policy'].blank? ? nil : incident['escalation_policy']['name']
        pdi.urgency = incident['urgency']
        pdi.auto_resolved = incident['auto_resolved']
        pdi.escalation_count = incident['escalation_count']
        pdi.auto_escalation_count = incident['auto_escalation_count']
        pdi.acknowledge_count = incident['acknowledge_count']
        pdi.assignment_count = incident['assignment_count']
        pdi.acknowledged_by_user_ids = incident['acknowledged_by_user_ids']
        pdi.acknowledged_by_user_names = incident['acknowledged_by_user_names']
        pdi.assigned_to_user_ids = incident['assigned_to_user_ids']
        pdi.assigned_to_user_names = incident['assigned_to_user_names']
        pdi.resolved_by_user_id = incident['resolved_by_user_id']
        pdi.resolved_by_user_name = incident['resolved_by_user_name']

        # If need more information from another API would look like this
        log_entries_uri = URI("https://api.pagerduty.com/incidents/#{incident['id']}/log_entries")
        headers = { Authorization: "Token token=#{pd.api_key}", Accept: 'application/vnd.pagerduty+json;version=2' }
        log_entries_response = HTTParty.get(log_entries_uri, headers: headers)

        log_entries_response['log_entries'].each do |log_entry|
          case log_entry['type']
          when 'trigger_log_entry'
            pdi.created_on = Time.iso8601(log_entry['created_at'])
          when 'resolve_log_entry'
            pdi.resolved_on = Time.iso8601(log_entry['created_at'])
          when 'acknowledge_log_entry'
            # Account for multiple acknowledge enteries and use earliest one
            acknowledged_on = pdi.acknowledged_on.blank? ? Time.now.iso8601 : pdi.acknowledged_on
            pdi.acknowledged_on = Time.iso8601(log_entry['created_at']) if log_entry['created_at'] < acknowledged_on
          when 'assign_log_entry'
            # Need to rethink for mutliple re-assigns? Or just drop completely, maybe a re-assign account display?
            pdi.assigned_on = Time.iso8601(log_entry['created_at'])
          end
        end

        if pdi.created_on.present?
          # These figures are what matter most, this is what is used to create the graphs
          pdi.seconds_to_first_ack = pdi.acknowledged_on - pdi.created_on if incident['acknowledgements'].count.positive?
          pdi.seconds_to_first_ack = pdi.resolved_on - pdi.created_on unless incident['acknowledgements'].count.positive?
          pdi.seconds_to_resolve = pdi.resolved_on - pdi.created_on if incident['status'] == 'resolved'
        end

        pdi.save! if pdi.created_on.present?
      end
      pd.initial = false
      pd.save!
    end
  end
end
