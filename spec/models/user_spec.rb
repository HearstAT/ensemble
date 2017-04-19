# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, :type => :model do
  subject { described_class.new }

  before(:each) do
    FactoryGirl.create(:domain)
  end

  describe "Validations" do
    it "is valid with valid attributes" do
        subject.email = 'test@example.com'
        subject.password = 'password'
        expect(subject).to be_valid
    end

    it "is not valid without password" do
        subject.email = 'test@example.com'
        expect(subject).to_not be_valid
    end

    it "is not valid without email" do
        subject.password = 'password'
        expect(subject).to_not be_valid
    end

    it "is not valid with invalid email domain" do
        subject.email = 'test@example2.com'
        subject.password = 'password'
        expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "has business units" do
      assc = described_class.reflect_on_association(:business_units)
      expect(assc.macro).to eq :has_many
    end
  end

end
