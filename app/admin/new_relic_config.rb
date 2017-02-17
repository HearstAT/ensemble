ActiveAdmin.register NewRelicConfig do
  before_action :authenticate_active_admin_user!
  permit_params :business_unit_id, :account_number, :api_key
end
