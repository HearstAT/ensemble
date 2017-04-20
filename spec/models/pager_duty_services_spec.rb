# frozen_string_literal: true
require 'rails_helper'

RSpec.describe PagerDutyService, type: :model do
  subject { described_class.new }

  describe 'Associations' do
    it 'belongs_to business units' do
      assc = described_class.reflect_on_association(:pager_duty_config)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
