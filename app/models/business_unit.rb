class BusinessUnit < ApplicationRecord
  has_many :pager_duty_incident
  validates :name, presence: true
  validates :location, presence: true
end
