class PagerDutyConfig < ApplicationRecord
  belongs_to :business_unit
  validates :sub_domain, presence: true
  validates :api_key, presence: true
end
