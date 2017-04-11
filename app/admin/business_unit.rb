ActiveAdmin.register UserBusinessUnit do
  belongs_to :business_unit
  navigation_menu :business_unit
end

ActiveAdmin.register BusinessUnit do
  before_action :authenticate_active_admin_user!
  permit_params :name,
                :location,
                user_business_unit_ids: [],
                user_business_unit_attributes: [:id, :user_id, :business_unit_id]

  form do |f|
    f.inputs "Admin Details" do
      f.input :name
      f.input :location
      f.input :users, as: :check_boxes, collection: User.all
    end

    #f.inputs do
    #  f.has_many :users, allow_destroy: true, new_record: true do |a|
    #    a.input :user
    #    a.input :user_business_unit
    #  end
    #end
    f.actions
  end

end
