ActiveAdmin.register PagerDutyConfig do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :sub_domain, :api_key, :service_api_key, :business_unit
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    selectable_column
    id_column
    column :business_unit
    column :sub_domain
    column :api_key
    column :service_api_key
    actions
  end


end
