# frozen_string_literal: true
ActiveAdmin.register PagerDutyService do
  belongs_to :pager_duty_config
  navigation_menu :pager_duty_config
end

ActiveAdmin.register PagerDutyConfig do
  before_action :authenticate_active_admin_user!
  permit_params :sub_domain,
                :api_key,
                :service_api_key,
                :business_unit_id,
                pager_duty_service_attributes: [:id, :display]

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
    f.inputs 'Admin Details' do
      f.input :business_unit
      f.input :sub_domain
      f.input :api_key, as: :password
      f.input :service_api_key, as: :password
      f.has_many :pager_duty_service, new_record: false do |pds|
        pds.input :name
        pds.input :pager_duty_service_id
        pds.input :display
      end
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
      row :pager_duty_service do
        table_for pdc.pager_duty_service do
          column :name
          column :pager_duty_service_id
          column :display
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
