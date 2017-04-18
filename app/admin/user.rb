ActiveAdmin.register User do
  before_action :authenticate_active_admin_user!
  permit_params :name,
                :email,
                :password,
                :password_confirmation,
                :admin,
                user_business_unit: [:id, :business_unit, :user]

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :admin
    actions
  end

  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :admin

  form do |f|
    f.inputs 'Admin Details' do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
      f.input :business_units, as: :check_boxes
    end
    f.actions
  end
end
