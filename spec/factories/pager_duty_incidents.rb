FactoryGirl.define do
  factory :pager_duty_incident do
    business_unit
    incident_number 1
    description 'MyString'
    service_id 'MyString'
    service_name 'MyString'
    escalation_policy_id 'MyString'
    escalation_policy_name 'MyString'
    created_on { 1.days.ago }
    resolved_on { 1.days.ago + 10.minutes }
    seconds_to_first_ack 100
    seconds_to_resolve 600
    auto_resolved 0
    escalation_count 0
    auto_escalation_count 0
    acknowledge_count 1
    assignment_count 1
    acknowledged_by_user_ids 'MyString'
    acknowledged_by_user_names 'MyString'
    assigned_to_user_ids 'MyString'
    assigned_to_user_names 'MyString'
    resolved_by_user_id 'MyString'
    resolved_by_user_name 'MyString'
    urgency 'high'
  end
end
