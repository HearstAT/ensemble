ActiveAdmin.register PagerDutyConfig do
  before_action :authenticate_active_admin_user!
  permit_params :sub_domain, :api_key, :service_api_key, :business_unit_id

  index do
    selectable_column
    id_column
    column :business_unit_id
    column :sub_domain
    column :created_at
    column :updated_at
    actions
  end

  filter :sub_domain
  filter :api_key
  filter :service_api_key
  filter :business_unit_id
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :business_unit_id
      f.input :sub_domain
      f.input :api_key, as: :password
      f.input :service_api_key, as: :password
    end
    f.actions
  end

  show do |pdc|
    attributes_table do
      row :id
      row :business_unit_id
      row :sub_domain
      # TODO: clean this up some
      row :api_key do
         pdc.api_key.gsub!(/[a-zA-Z0-9]/, '*')
      end
      row :service_api_key do
         pdc.service_api_key.gsub!(/[a-zA-Z0-9]/, '*')
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

end
