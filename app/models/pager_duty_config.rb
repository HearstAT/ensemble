# frozen_string_literal: true
class PagerDutyConfig < ApplicationRecord
  belongs_to :business_unit
  has_many :pager_duty_service
  accepts_nested_attributes_for :pager_duty_service, reject_if: :new_record?
  validates :sub_domain, presence: true
  validates :api_key, presence: true
end
