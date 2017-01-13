require 'test_helper'

class PagerDutyIncidentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pager_duty_incident = pager_duty_incidents(:one)
  end

  test "should get index" do
    get pager_duty_incidents_url
    assert_response :success
  end

  test "should get new" do
    get new_pager_duty_incident_url
    assert_response :success
  end

  test "should create pager_duty_incident" do
    assert_difference('PagerDutyIncident.count') do
      post pager_duty_incidents_url, params: { pager_duty_incident: { acknowledge_count: @pager_duty_incident.acknowledge_count, acknowledged_by_user_ids: @pager_duty_incident.acknowledged_by_user_ids, acknowledged_by_user_names: @pager_duty_incident.acknowledged_by_user_names, assignment_count: @pager_duty_incident.assignment_count, auto_resolved: @pager_duty_incident.auto_resolved, business_unit_id: @pager_duty_incident.business_unit_id, created_on: @pager_duty_incident.created_on, description: @pager_duty_incident.description, escalation_policy_id: @pager_duty_incident.escalation_policy_id, id: @pager_duty_incident.id, incident_number: @pager_duty_incident.incident_number, resolved_by_user_id: @pager_duty_incident.resolved_by_user_id, resolved_by_user_name: @pager_duty_incident.resolved_by_user_name, resolved_on: @pager_duty_incident.resolved_on, seconds_to_first_ack: @pager_duty_incident.seconds_to_first_ack, seconds_to_resolve: @pager_duty_incident.seconds_to_resolve, service_id: @pager_duty_incident.service_id, service_name: @pager_duty_incident.service_name, urgency: @pager_duty_incident.urgency } }
    end

    assert_redirected_to pager_duty_incident_url(PagerDutyIncident.last)
  end

  test "should show pager_duty_incident" do
    get pager_duty_incident_url(@pager_duty_incident)
    assert_response :success
  end

  test "should get edit" do
    get edit_pager_duty_incident_url(@pager_duty_incident)
    assert_response :success
  end

  test "should update pager_duty_incident" do
    patch pager_duty_incident_url(@pager_duty_incident), params: { pager_duty_incident: { acknowledge_count: @pager_duty_incident.acknowledge_count, acknowledged_by_user_ids: @pager_duty_incident.acknowledged_by_user_ids, acknowledged_by_user_names: @pager_duty_incident.acknowledged_by_user_names, assignment_count: @pager_duty_incident.assignment_count, auto_resolved: @pager_duty_incident.auto_resolved, business_unit_id: @pager_duty_incident.business_unit_id, created_on: @pager_duty_incident.created_on, description: @pager_duty_incident.description, escalation_policy_id: @pager_duty_incident.escalation_policy_id, id: @pager_duty_incident.id, incident_number: @pager_duty_incident.incident_number, resolved_by_user_id: @pager_duty_incident.resolved_by_user_id, resolved_by_user_name: @pager_duty_incident.resolved_by_user_name, resolved_on: @pager_duty_incident.resolved_on, seconds_to_first_ack: @pager_duty_incident.seconds_to_first_ack, seconds_to_resolve: @pager_duty_incident.seconds_to_resolve, service_id: @pager_duty_incident.service_id, service_name: @pager_duty_incident.service_name, urgency: @pager_duty_incident.urgency } }
    assert_redirected_to pager_duty_incident_url(@pager_duty_incident)
  end

  test "should destroy pager_duty_incident" do
    assert_difference('PagerDutyIncident.count', -1) do
      delete pager_duty_incident_url(@pager_duty_incident)
    end

    assert_redirected_to pager_duty_incidents_url
  end
end
