class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # configure permitted parameters for devise
  def configure_permitted_parameters
    # added_attrs = [:email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache]
    # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache) }
  end
end
