# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PagerDutyConfig, :type => :model do
  subject { described_class.new }

  describe "Validations" do
    it "is valid with valid attributes" do
        subject.sub_domain = 'sudomain'
        subject.api_key = 'api_key'
        expect(subject).to be_valid
    end

    it "is not valid without sub_domain" do
        subject.api_key = 'api_key'
        expect(subject).to_not be_valid
    end

    it "is not valid without api_key" do
        subject.sub_domain = 'sub_domain'
        expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "belongs_to business units" do
      assc = described_class.reflect_on_association(:business_unit)
      expect(assc.macro).to eq :belongs_to
    end

    it "has_many business units" do
      assc = described_class.reflect_on_association(:pager_duty_service)
      expect(assc.macro).to eq :has_many
    end
  end
end
