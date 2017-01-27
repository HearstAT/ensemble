require 'httparty'
require 'net/http'
require 'net/https'

class PagerDutyJob < ApplicationJob
  queue_as :default

  def perform(*args)
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
        csv = CSV.new(res.body, :headers => true, :header_converters => :symbol, :converters => [:all, :blank_to_nil])
        puts csv
        csv_hash = csv.to_a.map {|row| row.to_h }
      rescue StandardError => e
        puts "HTTP Request failed (#{e.message})"
      end

      csv_hash.each do |incident|
        # Overwrite/update if already in database
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
        #pdi.escalation_policy_name = incident[:escalation_policy_name]
        pdi.created_on = incident[:created_on]
        pdi.resolved_on = incident[:resolved_on]
        pdi.seconds_to_first_ack = incident[:seconds_to_first_ack]
        pdi.seconds_to_resolve = incident[:seconds_to_resolve]
        pdi.auto_resolved = incident[:auto_resolved]
        #pdi.escalation_count = incident[:escalation_count]
        #pdi.auto_escalation_count = incident[:auto_escalation_count]
        pdi.acknowledge_count = incident[:acknowledge_count]
        pdi.assignment_count = incident[:assignment_count]
        pdi.acknowledged_by_user_ids = incident[:acknowledged_by_user_ids]
        pdi.acknowledged_by_user_names = incident[:acknowledged_by_user_names]
        #pdi.assigned_to_user_ids = incident[:assigned_to_user_ids]
        #pdi.assigned_to_user_names = incident[:assigned_to_user_names]
        pdi.resolved_by_user_id = incident[:resolved_by_user_id]
        pdi.resolved_by_user_name = incident[:resolved_by_user_name]
        pdi.urgency = incident[:urgency]
        pdi.save!
      end
    end
  end
end
