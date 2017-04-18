require 'test_helper'

class PagerDutyReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pager_duty_report = pager_duty_reports(:one)
  end

  test 'should get index' do
    get pager_duty_reports_url
    assert_response :success
  end

  test 'should get new' do
    get new_pager_duty_report_url
    assert_response :success
  end

  test 'should create pager_duty_report' do
    assert_difference('PagerDutyReport.count') do
      post pager_duty_reports_url, params: { pager_duty_report: { business_unit_id: @pager_duty_report.business_unit_id, number_of_incidents: @pager_duty_report.number_of_incidents } }
    end

    assert_redirected_to pager_duty_report_url(PagerDutyReport.last)
  end

  test 'should show pager_duty_report' do
    get pager_duty_report_url(@pager_duty_report)
    assert_response :success
  end

  test 'should get edit' do
    get edit_pager_duty_report_url(@pager_duty_report)
    assert_response :success
  end

  test 'should update pager_duty_report' do
    patch pager_duty_report_url(@pager_duty_report), params: { pager_duty_report: { business_unit_id: @pager_duty_report.business_unit_id, number_of_incidents: @pager_duty_report.number_of_incidents } }
    assert_redirected_to pager_duty_report_url(@pager_duty_report)
  end

  test 'should destroy pager_duty_report' do
    assert_difference('PagerDutyReport.count', -1) do
      delete pager_duty_report_url(@pager_duty_report)
    end

    assert_redirected_to pager_duty_reports_url
  end
end
