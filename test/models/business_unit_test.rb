# frozen_string_literal: true
require 'test_helper'

class BusinessUnitTest < ActiveSupport::TestCase
  test 'should not save business_unit without valid name or location' do
    business = BusinessUnit.new
    assert_not business.save
  end

  test 'should not save business_unit without valid name' do
    business = BusinessUnit.new(location: 'somewhere')
    assert_not business.save
  end

  test 'should not save business_unit without valid location' do
    business = BusinessUnit.new(name: 'business')
    assert_not business.save
  end

  test 'should save business_unit with valid name and location' do
    business = BusinessUnit.new(name: 'business', location: 'somewhere')
    assert business.save
  end
end
