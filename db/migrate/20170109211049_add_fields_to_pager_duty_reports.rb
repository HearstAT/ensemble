# frozen_string_literal: true
class AddFieldsToPagerDutyReports < ActiveRecord::Migration[5.0]
  def change
    add_column :pager_duty_reports, :active, :boolean
    add_column :pager_duty_reports, :start_date, :datetime
    add_column :pager_duty_reports, :end_date, :datetime
  end
end
