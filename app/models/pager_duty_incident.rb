# frozen_string_literal: true
class PagerDutyIncident < ApplicationRecord
  belongs_to :business_unit
end
