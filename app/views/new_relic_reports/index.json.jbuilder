# frozen_string_literal: true
json.array! @new_relic_reports, partial: 'new_relic_reports/new_relic_report', as: :new_relic_report
