ActiveAdmin.register BusinessUnit do
  before_action :authenticate_active_admin_user!
  permit_params :name, :location
end
