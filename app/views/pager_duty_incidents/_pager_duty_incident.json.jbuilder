# frozen_string_literal: true
json.extract! pager_duty_incident, :id, :business_unit_id, :id, :incident_number, :description, :service_id, :service_name, :escalation_policy_id, :created_on, :resolved_on, :seconds_to_first_ack, :seconds_to_resolve, :auto_resolved, :acknowledge_count, :assignment_count, :acknowledged_by_user_ids, :acknowledged_by_user_names, :resolved_by_user_id, :resolved_by_user_name, :urgency, :created_at, :updated_at
json.url pager_duty_incident_url(pager_duty_incident, format: :json)
