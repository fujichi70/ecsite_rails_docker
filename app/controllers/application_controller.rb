class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:admin_number, :user_id, :name, :email, :password, :password_confirmation , address_attributes: [:zip, :address, :phone] ])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:admin_number, :email, :password, :remember_me])
	end
end
