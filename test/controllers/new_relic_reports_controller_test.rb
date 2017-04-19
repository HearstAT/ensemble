# frozen_string_literal: true
require 'test_helper'

class NewRelicReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_relic_report = new_relic_reports(:one)
  end

  test 'should get index' do
    get new_relic_reports_url
    assert_response :success
  end

  test 'should get new' do
    get new_new_relic_report_url
    assert_response :success
  end

  test 'should create new_relic_report' do
    assert_difference('NewRelicReport.count') do
      post new_relic_reports_url, params: { new_relic_report: { business_unit_id: @new_relic_report.business_unit_id, number_of_apps: @new_relic_report.number_of_apps, number_of_servers: @new_relic_report.number_of_servers } }
    end

    assert_redirected_to new_relic_report_url(NewRelicReport.last)
  end

  test 'should show new_relic_report' do
    get new_relic_report_url(@new_relic_report)
    assert_response :success
  end

  test 'should get edit' do
    get edit_new_relic_report_url(@new_relic_report)
    assert_response :success
  end

  test 'should update new_relic_report' do
    patch new_relic_report_url(@new_relic_report), params: { new_relic_report: { business_unit_id: @new_relic_report.business_unit_id, number_of_apps: @new_relic_report.number_of_apps, number_of_servers: @new_relic_report.number_of_servers } }
    assert_redirected_to new_relic_report_url(@new_relic_report)
  end

  test 'should destroy new_relic_report' do
    assert_difference('NewRelicReport.count', -1) do
      delete new_relic_report_url(@new_relic_report)
    end

    assert_redirected_to new_relic_reports_url
  end
end
