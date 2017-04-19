# frozen_string_literal: true
class BusinessUnit < ApplicationRecord
  has_many :pager_duty_incident
  has_many :user_business_units
  has_many :users, through: :user_business_units
  accepts_nested_attributes_for :user_business_units, reject_if: :new_record?
  validates :name, presence: true
  validates :location, presence: true
end
