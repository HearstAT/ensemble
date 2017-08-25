class AddAssignedOnToPagerDutyIncidents < ActiveRecord::Migration[5.0]
  def change
    add_column :pager_duty_incidents, :assigned_on, :datetime
  end
end
