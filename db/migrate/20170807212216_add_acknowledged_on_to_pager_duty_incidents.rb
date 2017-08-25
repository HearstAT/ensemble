class AddAcknowledgedOnToPagerDutyIncidents < ActiveRecord::Migration[5.0]
  def change
    add_column :pager_duty_incidents, :acknowledged_on, :datetime
  end
end
