class CreatePagerDutyIncidents < ActiveRecord::Migration[5.0]
  def change
    create_table :pager_duty_incidents do |t|
      t.references :business_unit, foreign_key: true
      t.string :pager_duty_id
      t.integer :incident_number
      t.string :description
      t.string :service_id
      t.string :service_name
      t.string :escalation_policy_id
      t.datetime :created_on
      t.datetime :resolved_on
      t.integer :seconds_to_first_ack
      t.integer :seconds_to_resolve
      t.integer :auto_resolved
      t.integer :acknowledge_count
      t.integer :assignment_count
      t.string :acknowledged_by_user_ids
      t.string :acknowledged_by_user_names
      t.string :resolved_by_user_id
      t.string :resolved_by_user_name
      t.string :urgency

      t.timestamps
    end
  end
end
