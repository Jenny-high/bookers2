class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about], unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    flash[:notice] = "Signed in successfully."
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed out successfully."
    root_path
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = "Welcome! You have signed up successfully."
    user_path(resource)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
  end
end
def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
end
