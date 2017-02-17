require 'test_helper'

class DomainTest < ActiveSupport::TestCase
  test 'should not save domain without domain' do
    domain = Domain.new
    assert_not domain.save
  end

  test 'should save domain with valid domain' do
    domain = Domain.new(domain: 'example.com')
    assert domain.save
  end
end
