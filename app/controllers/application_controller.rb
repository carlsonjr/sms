class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:phone_number, :enabled, :time_zone, :reflection_interval, :last_reflection_on])
    devise_parameter_sanitizer.permit(:account_update, :keys => [:phone_number, :enabled, :time_zone])
  end
end
