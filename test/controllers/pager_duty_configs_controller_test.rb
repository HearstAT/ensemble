# frozen_string_literal: true
require 'test_helper'

class PagerDutyConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pager_duty_config = pager_duty_configs(:one)
  end

  test 'should get index' do
    get pager_duty_configs_url
    assert_response :success
  end

  test 'should get new' do
    get new_pager_duty_config_url
    assert_response :success
  end

  test 'should create pager_duty_config' do
    assert_difference('PagerDutyConfig.count') do
      post pager_duty_configs_url, params: { pager_duty_config: { api_key: @pager_duty_config.api_key, business_unit_id: @pager_duty_config.business_unit_id, service_api_key: @pager_duty_config.service_api_key, sub_domain: @pager_duty_config.sub_domain } }
    end

    assert_redirected_to pager_duty_config_url(PagerDutyConfig.last)
  end

  test 'should show pager_duty_config' do
    get pager_duty_config_url(@pager_duty_config)
    assert_response :success
  end

  test 'should get edit' do
    get edit_pager_duty_config_url(@pager_duty_config)
    assert_response :success
  end

  test 'should update pager_duty_config' do
    patch pager_duty_config_url(@pager_duty_config), params: { pager_duty_config: { api_key: @pager_duty_config.api_key, business_unit_id: @pager_duty_config.business_unit_id, service_api_key: @pager_duty_config.service_api_key, sub_domain: @pager_duty_config.sub_domain } }
    assert_redirected_to pager_duty_config_url(@pager_duty_config)
  end

  test 'should destroy pager_duty_config' do
    assert_difference('PagerDutyConfig.count', -1) do
      delete pager_duty_config_url(@pager_duty_config)
    end

    assert_redirected_to pager_duty_configs_url
  end
end
