require 'test_helper'

class ChefConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chef_config = chef_configs(:one)
  end

  test "should get index" do
    get chef_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_chef_config_url
    assert_response :success
  end

  test "should create chef_config" do
    assert_difference('ChefConfig.count') do
      post chef_configs_url, params: { chef_config: { admins: @chef_config.admins, business_unit_id: @chef_config.business_unit_id, chef_organization: @chef_config.chef_organization, chef_server_url: @chef_config.chef_server_url } }
    end

    assert_redirected_to chef_config_url(ChefConfig.last)
  end

  test "should show chef_config" do
    get chef_config_url(@chef_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_chef_config_url(@chef_config)
    assert_response :success
  end

  test "should update chef_config" do
    patch chef_config_url(@chef_config), params: { chef_config: { admins: @chef_config.admins, business_unit_id: @chef_config.business_unit_id, chef_organization: @chef_config.chef_organization, chef_server_url: @chef_config.chef_server_url } }
    assert_redirected_to chef_config_url(@chef_config)
  end

  test "should destroy chef_config" do
    assert_difference('ChefConfig.count', -1) do
      delete chef_config_url(@chef_config)
    end

    assert_redirected_to chef_configs_url
  end
end
