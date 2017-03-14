class ConfirmationsController < Devise::ConfirmationsController
  protected
  
  def after_confirmation_path_for(resource_name, resource)
    root_path
  end

  def after_inactive_sign_up_path_for(resource)
    root_path
  end

end