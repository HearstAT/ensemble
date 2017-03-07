class PagerDutyIncident < ApplicationRecord
  belongs_to :business_unit
  attr_accessor :business_unit_id, :pager_duty_id, :description,
    :service_id, :service_name, :created_on, :resolved_on, :seconds_to_first_ack,
    :seconds_to_resolve

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      PagerDutyIncident.all.all.is_a?(ActiveRecord::Relation)
    end
  end

end
