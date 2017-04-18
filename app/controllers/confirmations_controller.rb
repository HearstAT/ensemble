class ConfirmationsController < Devise::ConfirmationsController
  protected

  def after_confirmation_path_for(_resource_name, _resource)
    root_path
  end

  def after_inactive_sign_up_path_for(_resource)
    root_path
  end
end
