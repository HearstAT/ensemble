# frozen_string_literal: true
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without valid domain' do
    user = User.new
    assert_not user.save
  end

  test 'should save user with valid domain' do
    domain = Domain.new(domain: 'example.com')
    assert domain.save
    user = User.new(email: 'user@example.com')
    assert_not user.save
  end
end
