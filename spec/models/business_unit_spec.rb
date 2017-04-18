require 'rails_helper'

RSpec.describe BusinessUnit, type: :model do
  it 'is not valid without name or location' do
    expect(BusinessUnit.new).not_to be_valid
  end

  it 'is not valid without name' do
    expect(BusinessUnit.new(location: 'somewhere')).not_to be_valid
  end

  it 'is not valid without name' do
    expect(BusinessUnit.new(name: 'business')).not_to be_valid
  end

  it 'is not valid without name' do
    expect(BusinessUnit.new(name: 'business', location: 'somewhere')).to be_valid
  end
end
