# frozen_string_literal: true
json.extract! contact, :id, :business_unit_id, :name, :is_user, :created_at, :updated_at
json.url contact_url(contact, format: :json)
