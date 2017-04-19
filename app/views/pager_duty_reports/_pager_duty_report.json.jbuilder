# frozen_string_literal: true
json.extract! pager_duty_report, :id, :business_unit_id, :number_of_incidents, :created_at, :updated_at
json.url pager_duty_report_url(pager_duty_report, format: :json)
