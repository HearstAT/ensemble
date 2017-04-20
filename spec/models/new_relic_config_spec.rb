# frozen_string_literal: true
require 'rails_helper'

RSpec.describe NewRelicConfig, type: :model do
  subject { described_class.new }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      subject.account_number = 'account_number'
      subject.api_key = 'api_key'
      expect(subject).to be_valid
    end

    it 'is not valid without account_number' do
      subject.api_key = 'api_key'
      expect(subject).to_not be_valid
    end

    it 'is not valid without api_key' do
      subject.account_number = 'account_number'
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'belongs_to business units' do
      assc = described_class.reflect_on_association(:business_unit)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
