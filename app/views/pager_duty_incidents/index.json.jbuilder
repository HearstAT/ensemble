# frozen_string_literal: true
json.array! @pager_duty_incidents, partial: 'pager_duty_incidents/pager_duty_incident', as: :pager_duty_incident
