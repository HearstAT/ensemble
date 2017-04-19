# frozen_string_literal: true
require 'test_helper'

class NewRelicConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_relic_config = new_relic_configs(:one)
  end

  test 'should get index' do
    get new_relic_configs_url
    assert_response :success
  end

  test 'should get new' do
    get new_new_relic_config_url
    assert_response :success
  end

  test 'should create new_relic_config' do
    assert_difference('NewRelicConfig.count') do
      post new_relic_configs_url, params: { new_relic_config: { account_number: @new_relic_config.account_number, api_key: @new_relic_config.api_key, business_unit_id: @new_relic_config.business_unit_id } }
    end

    assert_redirected_to new_relic_config_url(NewRelicConfig.last)
  end

  test 'should show new_relic_config' do
    get new_relic_config_url(@new_relic_config)
    assert_response :success
  end

  test 'should get edit' do
    get edit_new_relic_config_url(@new_relic_config)
    assert_response :success
  end

  test 'should update new_relic_config' do
    patch new_relic_config_url(@new_relic_config), params: { new_relic_config: { account_number: @new_relic_config.account_number, api_key: @new_relic_config.api_key, business_unit_id: @new_relic_config.business_unit_id } }
    assert_redirected_to new_relic_config_url(@new_relic_config)
  end

  test 'should destroy new_relic_config' do
    assert_difference('NewRelicConfig.count', -1) do
      delete new_relic_config_url(@new_relic_config)
    end

    assert_redirected_to new_relic_configs_url
  end
end
