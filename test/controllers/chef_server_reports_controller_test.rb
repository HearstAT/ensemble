require 'test_helper'

class ChefServerReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chef_server_report = chef_server_reports(:one)
  end

  test "should get index" do
    get chef_server_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_chef_server_report_url
    assert_response :success
  end

  test "should create chef_server_report" do
    assert_difference('ChefServerReport.count') do
      post chef_server_reports_url, params: { chef_server_report: { business_unit_id: @chef_server_report.business_unit_id, number_of_cookbooks: @chef_server_report.number_of_cookbooks, number_of_nodes: @chef_server_report.number_of_nodes, number_of_users: @chef_server_report.number_of_users } }
    end

    assert_redirected_to chef_server_report_url(ChefServerReport.last)
  end

  test "should show chef_server_report" do
    get chef_server_report_url(@chef_server_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_chef_server_report_url(@chef_server_report)
    assert_response :success
  end

  test "should update chef_server_report" do
    patch chef_server_report_url(@chef_server_report), params: { chef_server_report: { business_unit_id: @chef_server_report.business_unit_id, number_of_cookbooks: @chef_server_report.number_of_cookbooks, number_of_nodes: @chef_server_report.number_of_nodes, number_of_users: @chef_server_report.number_of_users } }
    assert_redirected_to chef_server_report_url(@chef_server_report)
  end

  test "should destroy chef_server_report" do
    assert_difference('ChefServerReport.count', -1) do
      delete chef_server_report_url(@chef_server_report)
    end

    assert_redirected_to chef_server_reports_url
  end
end
