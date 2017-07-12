# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  before(:each) do
    FactoryGirl.create(:domain)
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(create(:user)).to be_valid
    end

    it 'is not valid without password' do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid without email' do
      # TODO, need up update for a nil check before the split on @ symbol
      subject.password = 'password'
      expect(subject).to_not be_valid
    end

    it 'is not valid with invalid email domain' do
      user = build(:user, email: 'test@example2.com')
      expect(user).to_not be_valid
    end
  end

  describe 'Confirmed User' do
    it 'can create' do
      expect(create(:confirmed_user)).to be_valid
    end
  end

  describe 'Admin User' do
    it 'can create' do
      expect(create(:admin_user)).to be_valid
    end
  end

  describe 'Associations' do
    it 'has business units' do
      assc = described_class.reflect_on_association(:business_units)
      expect(assc.macro).to eq :has_many
    end
  end
end
