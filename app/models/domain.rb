class Domain < ApplicationRecord
  validates :domain, presence: true
end
