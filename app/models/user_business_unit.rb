# frozen_string_literal: true
class UserBusinessUnit < ApplicationRecord
  belongs_to :business_unit
  belongs_to :user
end
