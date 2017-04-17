require 'rails_helper'

RSpec.describe Domain, :type => :model do
  it 'is not valid without domain' do
    expect(Domain.new).not_to be_valid
  end

  it 'is not valid without name' do
    domain = create(:domain)
    expect(domain).to be_valid
  end
end