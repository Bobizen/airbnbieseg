class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:legal_name, :phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:legal_name, :phone_number, :goverment_id, :address, :descriiption, :emergency_contact_number])
  end
end
