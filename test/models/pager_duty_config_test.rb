# frozen_string_literal: true
require 'test_helper'

class PagerDutyConfigTest < ActiveSupport::TestCase
  test 'should not save pager duty config without valid sub domain or api key' do
    pdc = PagerDutyConfig.new
    assert_not pdc.save
  end

  test 'should not save pager duty config without valid sub domain' do
    pdc = PagerDutyConfig.new(api_key: 'ABC123')
    assert_not pdc.save
  end

  test 'should not save pager duty config without valid api key' do
    pdc = PagerDutyConfig.new(sub_domain: 'business')
    assert_not pdc.save
  end

  test 'should save pager duty config with valid sub domain and api key' do
    pdc = PagerDutyConfig.new(sub_domain: 'business', api_key: 'ABC123')
    assert pdc.save
  end
end
