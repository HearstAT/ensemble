# frozen_string_literal: true
json.array! @chef_server_reports, partial: 'chef_server_reports/chef_server_report', as: :chef_server_report
