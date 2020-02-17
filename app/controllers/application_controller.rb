class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # private
  def after_sign_out_path_for(resource)
    #new_user_session_path
    root_path
  end
  def after_sign_in_path_for(resource)
    user_path(@user.id)
  end
  protected
  #deviseのストロングパラメーター追加(deviseコントローラーはgem本体にあるため、代わりにapplication_controller.rbで編集)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:picture])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :picture,:introduction,:region])
  end

end
