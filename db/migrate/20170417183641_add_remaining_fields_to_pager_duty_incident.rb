# frozen_string_literal: true
class AddRemainingFieldsToPagerDutyIncident < ActiveRecord::Migration[5.0]
  def change
    add_column :pager_duty_incidents, :escalation_policy_name, :string
    add_column :pager_duty_incidents, :escalation_count, :integer
    add_column :pager_duty_incidents, :auto_escalation_count, :integer
    add_column :pager_duty_incidents, :assigned_to_user_ids, :string
    add_column :pager_duty_incidents, :assigned_to_user_names, :string
  end
end
