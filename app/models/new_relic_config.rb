# frozen_string_literal: true
class NewRelicConfig < ApplicationRecord
  belongs_to :business_unit
  validates :account_number, presence: true
  validates :api_key, presence: true
end
